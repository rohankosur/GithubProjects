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
    
    keywords_map = []
    
    # Data section build
    data_section = bytearray()
    num_branches = len(db)
    data_section.extend(struct.pack('B', num_branches))
    
    for branch_idx_str, branch in sorted(db.items(), key=lambda x: int(x[0])):
        branch_idx = int(branch_idx_str)
        branch_name_comp = compress_string(branch['branch_name'], dictionary)
        data_section.extend(struct.pack('B', len(branch_name_comp)))
        data_section.extend(branch_name_comp)
        
        nodes = branch['nodes']
        data_section.extend(struct.pack('B', len(nodes)))
        
        for node_idx, node in enumerate(nodes):
            # Keyword indexing
            for kw in node['keywords']:
                kw_hash = djb2_hash(kw.lower())
                keywords_map.append((kw_hash, branch_idx, node_idx))
                
            # Serialize Node
            title_comp = compress_string(node['title'], dictionary)
            data_section.extend(struct.pack('B', len(title_comp)))
            data_section.extend(title_comp)
            
            for field in ['C', 'F', 'K', 'I', 'T']:
                field_comp = compress_string(node[field], dictionary)
                data_section.extend(struct.pack('H', len(field_comp)))
                data_section.extend(field_comp)

    # Sort keywords by hash for binary search
    keywords_map.sort(key=lambda x: x[0])
    
    index_section = bytearray()
    index_section.extend(struct.pack('H', len(keywords_map)))
    for h, b_idx, n_idx in keywords_map:
        index_section.extend(struct.pack('<I B B', h, b_idx, n_idx))
        
    full_payload = index_section + data_section
    
    # Chunking
    max_chunk = config['appvar_max_bytes']
    chunks = [full_payload[i:i+max_chunk] for i in range(0, len(full_payload), max_chunk)]
    
    os.makedirs(output_dir, exist_ok=True)
    
    for i, chunk in enumerate(chunks):
        appvar_name = f"STATDAT{i+1}"
        bin_path = os.path.join(output_dir, f"{appvar_name}.bin")
        with open(bin_path, 'wb') as f:
            f.write(chunk)
        print(f"Generated {bin_path} ({len(chunk)} bytes)")
        print(f"Use: convbin -j bin -i {bin_path} -k 8xv -o {os.path.join(output_dir, appvar_name)}.8xv -n {appvar_name}")

if __name__ == "__main__":
    # Running from project root
    generate_binaries("dataset/payload.json", "dataset")
