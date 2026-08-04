#include "search.h"

uint32_t djb2_hash(const char *str) {
    uint32_t hash = 5381;
    while (*str) {
        hash = ((hash << 5) + hash) + *str; // hash * 33 + c
        str++;
    }
    return hash;
}

bool binary_search_keyword(uint8_t *index_data, uint16_t num_keywords, uint32_t target_hash, uint8_t *out_branch, uint8_t *out_node) {
    int low = 0;
    int high = num_keywords - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2;
        uint8_t *entry = index_data + (mid * 6);
        uint32_t hash = entry[0] | (entry[1] << 8) | ((uint32_t)entry[2] << 16) | ((uint32_t)entry[3] << 24);
        
        if (hash == target_hash) {
            *out_branch = entry[4];
            *out_node = entry[5];
            return true;
        }
        if (hash < target_hash) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return false;
}
