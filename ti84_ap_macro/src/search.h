#ifndef SEARCH_H
#define SEARCH_H

#include <stdint.h>
#include <stdbool.h>

uint32_t djb2_hash(const char *str);

// Searches the keyword index for the best match across multiple words.
bool find_best_node(uint8_t *index_data, uint16_t num_keywords, const char *search_str, uint8_t *out_branch, uint8_t *out_node);

#endif
