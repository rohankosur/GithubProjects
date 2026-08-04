#include "search.h"
#include <string.h>

uint32_t djb2_hash(const char *str) {
    uint32_t hash = 5381;
    while (*str) {
        hash = ((hash << 5) + hash) + (uint8_t)(*str); // hash * 33 + c
        str++;
    }
    return hash;
}

#define MAX_NODES 512 // Adjust based on memory

bool find_best_node(uint8_t *index_data, uint16_t num_keywords, const char *search_str, uint8_t *out_branch, uint8_t *out_node) {
    // We need a way to map (branch, node) to a flat index or just store the best one found.
    
    // For simplicity and speed on the calculator, we'll do this:
    // 1. Tokenize search_str
    // 2. For each token, find ALL nodes that match in the index
    // 3. Keep track of the node with the most matches.
    
    char buffer[40];
    strncpy(buffer, search_str, 39);
    buffer[39] = '\0';
    
    uint8_t best_b = 0, best_n = 0;
    int max_score = 0;
    
    // Temporary score tracking (using a simple approach since we have few nodes per branch)
    // We'll use a 2D-like heuristic if possible, but let's stay simple.
    
    char *token = strtok(buffer, " ");
    while (token != NULL) {
        if (strlen(token) < 2) { token = strtok(NULL, " "); continue; }
        
        uint32_t h = djb2_hash(token);
        
        // Binary search for the first occurrence
        int low = 0;
        int high = num_keywords - 1;
        int first_idx = -1;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            uint8_t *entry = index_data + (mid * 6);
            uint32_t hash = entry[0] | (entry[1] << 8) | ((uint32_t)entry[2] << 16) | ((uint32_t)entry[3] << 24);
            
            if (hash == h) {
                first_idx = mid;
                high = mid - 1; // Look for earlier ones
            } else if (hash < h) low = mid + 1;
            else high = mid - 1;
        }
        
        if (first_idx != -1) {
            // Found matches! Iterate through all identical hashes
            for (int i = first_idx; i < num_keywords; i++) {
                uint8_t *entry = index_data + (i * 6);
                uint32_t hash = entry[0] | (entry[1] << 8) | ((uint32_t)entry[2] << 16) | ((uint32_t)entry[3] << 24);
                if (hash != h) break;
                
                uint8_t b = entry[4];
                uint8_t n = entry[5];
                
                // For now, since we don't have a huge node count, 
                // just pick the first one that appears. 
                // In a future version, we could use a hit-map.
                if (max_score == 0) {
                    best_b = b;
                    best_n = n;
                    max_score = 1;
                }
            }
        }
        token = strtok(NULL, " ");
    }
    
    if (max_score > 0) {
        *out_branch = best_b;
        *out_node = best_n;
        return true;
    }
    
    return false;
}
