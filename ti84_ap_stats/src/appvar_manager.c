#include "appvar_manager.h"
#include <fileioc.h>
#include <string.h>

bool init_database(APStatsDB *db) {
    db->num_appvars = 0;
    
    // For simplicity, just open STATDAT1
    uint8_t handle = ti_Open("STATDAT1", "r");
    if (!handle) return false;
    
    db->appvar_handles[0] = handle;
    db->num_appvars = 1;
    
    // ti_GetDataPtr gives a pointer to the START of the AppVar in the archive/RAM.
    uint8_t *base_ptr = (uint8_t *)ti_GetDataPtr(handle);
    if (!base_ptr) return false;
    
    // Read the true number of keywords from the first 2 bytes
    db->num_keywords = base_ptr[0] | (base_ptr[1] << 8);
    
    // Point the index_ptr directly to the array in the AppVar (skipping the 2 byte size header)
    db->index_ptr = base_ptr + 2;
    
    // Calculate the data pointer
    size_t index_size = 2 + (db->num_keywords * 6);
    db->data_ptr = base_ptr + index_size;
    
    return true;
}

void close_database(APStatsDB *db) {
    for (int i = 0; i < db->num_appvars; i++) {
        ti_Close(db->appvar_handles[i]);
    }
}

// Simple sequential scan through the Archive pointer to find the target node
// Since we didn't build an offset table to save space, we iterate.
bool get_node_data(APStatsDB *db, uint8_t target_branch, uint8_t target_node, 
                   const char **title, size_t *title_len,
                   const char **c_str, size_t *c_len,
                   const char **f_str, size_t *f_len,
                   const char **k_str, size_t *k_len,
                   const char **i_str, size_t *i_len,
                   const char **t_str, size_t *t_len) {
    
    uint8_t *ptr = (uint8_t *)db->data_ptr;
    
    uint8_t num_branches = *ptr++;
    for (uint8_t b = 0; b < num_branches; b++) {
        uint8_t branch_name_len = *ptr++;
        ptr += branch_name_len; // Skip branch name
        
        uint8_t num_nodes = *ptr++;
        for (uint8_t n = 0; n < num_nodes; n++) {
            
            uint8_t t_l = *ptr++;
            const char *t_ptr = (const char *)ptr;
            ptr += t_l;
            
            uint16_t c_l = ptr[0] | (ptr[1] << 8); ptr += 2;
            const char *c_p = (const char *)ptr; ptr += c_l;
            
            uint16_t f_l = ptr[0] | (ptr[1] << 8); ptr += 2;
            const char *f_p = (const char *)ptr; ptr += f_l;
            
            uint16_t k_l = ptr[0] | (ptr[1] << 8); ptr += 2;
            const char *k_p = (const char *)ptr; ptr += k_l;
            
            uint16_t i_l = ptr[0] | (ptr[1] << 8); ptr += 2;
            const char *i_p = (const char *)ptr; ptr += i_l;
            
            uint16_t tu_l = ptr[0] | (ptr[1] << 8); ptr += 2;
            const char *tu_p = (const char *)ptr; ptr += tu_l;
            
            if (b == target_branch && n == target_node) {
                *title = t_ptr; *title_len = t_l;
                *c_str = c_p; *c_len = c_l;
                *f_str = f_p; *f_len = f_l;
                *k_str = k_p; *k_len = k_l;
                *i_str = i_p; *i_len = i_l;
                *t_str = tu_p; *t_len = tu_l;
                return true;
            }
        }
    }
    return false;
}
