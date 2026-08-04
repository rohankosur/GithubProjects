#ifndef APPVAR_MANAGER_H
#define APPVAR_MANAGER_H

#include <stdint.h>
#include <stdbool.h>
#include "search.h"

typedef struct {
    uint8_t num_appvars;
    uint8_t appvar_handles[10];
    uint8_t *appvar_ptrs[10];
    uint16_t appvar_sizes[10];
    
    uint16_t num_keywords;
    uint8_t *index_ptr; 
    
    // Virtual offset of the data section
    uint32_t data_offset;
} APStatsDB;

bool init_database(APStatsDB *db);
void close_database(APStatsDB *db);

// Retrieves pointers to the compressed strings for a given node
bool get_node_data(APStatsDB *db, uint8_t target_branch, uint8_t target_node, 
                   const char **title, size_t *title_len,
                   const char **c_str, size_t *c_len,
                   const char **f_str, size_t *f_len,
                   const char **k_str, size_t *k_len,
                   const char **i_str, size_t *i_len,
                   const char **t_str, size_t *t_len);

#endif // APPVAR_MANAGER_H
