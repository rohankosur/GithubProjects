#include "appvar_manager.h"
#include <fileioc.h>
#include <string.h>

bool init_database(APStatsDB *db) {
    db->num_appvars = 0;
    char name[] = "MACDAT1";
    
    // Open all available MACDATx files
    for (int i = 0; i < 10; i++) {
        name[7] = '1' + i;
        uint8_t handle = ti_Open(name, "r");
        if (!handle) break;
        
        db->appvar_handles[i] = handle;
        db->appvar_ptrs[i] = (uint8_t *)ti_GetDataPtr(handle);
        db->appvar_sizes[i] = ti_GetSize(handle);
        db->num_appvars++;
    }
    
    if (db->num_appvars == 0) return false;
    
    // Index is always in MACDAT1
    uint8_t *base_ptr = db->appvar_ptrs[0];
    db->num_keywords = base_ptr[0] | (base_ptr[1] << 8);
    db->index_ptr = base_ptr + 2;
    
    // The data section starts right after the index in the virtual stream
    db->data_offset = 2 + (db->num_keywords * 6);
    
    return true;
}

void close_database(APStatsDB *db) {
    for (int i = 0; i < db->num_appvars; i++) {
        ti_Close(db->appvar_handles[i]);
    }
}

// Helper to get a pointer to a specific global offset across multiple files
uint8_t *get_virtual_ptr(APStatsDB *db, uint32_t offset) {
    uint32_t current_offset = 0;
    for (int i = 0; i < db->num_appvars; i++) {
        if (offset >= current_offset && offset < current_offset + db->appvar_sizes[i]) {
            return db->appvar_ptrs[i] + (offset - current_offset);
        }
        current_offset += db->appvar_sizes[i];
    }
    return NULL;
}

bool get_node_data(APStatsDB *db, uint8_t target_branch, uint8_t target_node, 
                   const char **title, size_t *title_len,
                   const char **c_str, size_t *c_len,
                   const char **f_str, size_t *f_len,
                   const char **k_str, size_t *k_len,
                   const char **i_str, size_t *i_len,
                   const char **t_str, size_t *t_len) {
    
    uint32_t offset = db->data_offset;
    uint8_t *ptr;
    
    #define READ_BYTE() (*get_virtual_ptr(db, offset++))
    #define READ_WORD() ({ uint16_t val = get_virtual_ptr(db, offset)[0] | (get_virtual_ptr(db, offset+1)[0] << 8); offset += 2; val; })
    #define GET_PTR() ((const char *)get_virtual_ptr(db, offset))

    uint8_t num_branches = READ_BYTE();
    for (uint8_t b = 0; b < num_branches; b++) {
        uint8_t branch_name_len = READ_BYTE();
        offset += branch_name_len; // Skip branch name
        
        uint8_t num_nodes = READ_BYTE();
        for (uint8_t n = 0; n < num_nodes; n++) {
            
            uint8_t t_l = READ_BYTE();
            const char *t_ptr = GET_PTR(); offset += t_l;
            
            uint16_t c_l = READ_WORD();
            const char *c_p = GET_PTR(); offset += c_l;
            
            uint16_t f_l = READ_WORD();
            const char *f_p = GET_PTR(); offset += f_l;
            
            uint16_t k_l = READ_WORD();
            const char *k_p = GET_PTR(); offset += k_l;
            
            uint16_t i_l = READ_WORD();
            const char *i_p = GET_PTR(); offset += i_l;
            
            uint16_t tu_l = READ_WORD();
            const char *tu_p = GET_PTR(); offset += tu_l;
            
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
