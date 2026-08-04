#ifndef SEARCH_H
#define SEARCH_H

#include <stdint.h>
#include <stdbool.h>

uint32_t djb2_hash(const char *str);

// Searches the keyword index for a matching hash and returns the branch/node indices.
// Returns true if found.
bool binary_search_keyword(uint8_t *index_data, uint16_t num_keywords, uint32_t target_hash, uint8_t *out_branch, uint8_t *out_node);

#endif
