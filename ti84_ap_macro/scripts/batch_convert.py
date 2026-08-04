import json
import os
import struct

def djb2_hash(s):
    hash_val = 5381
    for char in s:
        hash_val = ((hash_val << 5) + hash_val) + ord(char)
        hash_val &= 0xFFFFFFFF
    return hash_val

def compress_string(s, dictionary):
    if not s:
        return b""
    # Create an encoded string byte by byte
    out = bytearray()
    
    # Simple search and replace for dictionary words.
    # A robust compressor would tokenize, but we'll do simple replacement.
    # To avoid replacing parts of words (e.g. "mean" in "meaning"), we could use regex,
    # but for simplicity we'll just replace the exact strings.
    # We must sort the dictionary by length descending to replace longer words first.
    sorted_dict = sorted(enumerate(dictionary, start=1), key=lambda x: len(x[1]), reverse=True)
    
    # We will do a simple string replace for now. This isn't perfect tokenization but works for the prototype.
    temp_s = s
    for i, word in sorted_dict:
        # replace word with the token \x0i
        temp_s = temp_s.replace(word, chr(i))
    
    out.extend(temp_s.encode('ascii', 'ignore'))
    return bytes(out)

def generate_binaries(json_path, output_dir):
    with open(json_path, 'r') as f:
        payload = json.load(f)
        
    config = payload['system_config']
    db = payload['database']
    dictionary = config['compression_dictionary']
    max_chunk = config['appvar_max_bytes'] # 64000
    
    keywords_map = []
    
    # Step 1: Pre-generate all nodes
    all_branches = []
    for branch_idx_str, branch in sorted(db.items(), key=lambda x: int(x[0])):
        branch_idx = int(branch_idx_str)
        nodes_bin = []
        for node_idx, node in enumerate(branch['nodes']):
            for kw in node['keywords']:
                kw_hash = djb2_hash(kw.lower())
                keywords_map.append((kw_hash, branch_idx, node_idx))
            
            node_bin = bytearray()
            title_comp = compress_string(node['title'], dictionary)
            node_bin.extend(struct.pack('B', len(title_comp)))
            node_bin.extend(title_comp)
            for field in ['C', 'F', 'K', 'I', 'T']:
                field_comp = compress_string(node[field], dictionary)
                node_bin.extend(struct.pack('H', len(field_comp)))
                node_bin.extend(field_comp)
            nodes_bin.append(node_bin)
        all_branches.append((branch['branch_name'], nodes_bin))

    # Step 2: Build Index Section (Always in MACDAT1)
    keywords_map.sort(key=lambda x: x[0])
    index_section = bytearray()
    index_section.extend(struct.pack('H', len(keywords_map)))
    for h, b_idx, n_idx in keywords_map:
        index_section.extend(struct.pack('<I B B', h, b_idx, n_idx))
    
    # Step 3: Paged Packing
    chunks = []
    current_chunk = bytearray()
    current_chunk.extend(index_section)
    
    # Each chunk starts with a header: [uint16 num_nodes_in_this_chunk]
    # We will use a simpler structure: MACDAT1 has the index. 
    # MACDAT1..N have the actual data in a flat stream, but we pack smartly.
    
    # To keep the C code "optimized as earlier" (linear scan), we'll just
    # ensure that the linear scan can "skip" between files.
    
    full_payload = index_section
    # Actually, we'll just build the full payload and then slice at node boundaries
    data_stream = bytearray()
    data_stream.extend(struct.pack('B', len(all_branches)))
    for name, nodes in all_branches:
        name_comp = compress_string(name, dictionary)
        data_stream.extend(struct.pack('B', len(name_comp)))
        data_stream.extend(name_comp)
        data_stream.extend(struct.pack('B', len(nodes)))
        for n_bin in nodes:
            data_stream.extend(n_bin)

    # Smart Slice:
    chunks = []
    curr = 0
    while curr < len(total_data := (index_section + data_stream)):
        end = min(curr + max_chunk, len(total_data))
        # If we are not at the very end, we should try to find a safe split point
        # But for this implementation, we will just split and the C code 
        # will handle the multi-file pointer logic.
        chunks.append(total_data[curr:end])
        curr = end
    
    os.makedirs(output_dir, exist_ok=True)
    for i, chunk in enumerate(chunks):
        appvar_name = f"MACDAT{i+1}"
        bin_path = os.path.join(output_dir, f"{appvar_name}.bin")
        with open(bin_path, 'wb') as f:
            f.write(chunk)
        print(f"Generated {bin_path} ({len(chunk)} bytes)")

if __name__ == "__main__":
    # Running from project root
    generate_binaries("dataset/payload.json", "dataset")
