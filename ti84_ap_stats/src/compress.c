#include "compress.h"
#include <graphx.h>
#include <string.h>

const char *g_compression_dict[] = {
    "", // Index 0 unused
    "distribution", "population", "probability", "standard deviation", "proportion", 
    "hypothesis", "confidence interval", "significant", "random", "sample", "variable", 
    "expected", "observed", "residual", "correlation", "regression", "independent", 
    "statistic", "parameter", "evidence", "mean", "median", "normal", "condition"
};

const uint8_t g_dict_size = 24;

int print_compressed_string(int x, int y, int max_width, const char *compressed_str, size_t len) {
    char buffer[1024];
    int buf_len = 0;
    
    // Decompress into buffer
    for (size_t i = 0; i < len; i++) {
        uint8_t c = (uint8_t)compressed_str[i];
        if (c > 0 && c <= g_dict_size) {
            const char *word = g_compression_dict[c];
            while (*word && buf_len < 1023) {
                buffer[buf_len++] = *word++;
            }
        } else {
            if (buf_len < 1023) {
                buffer[buf_len++] = c;
            }
        }
    }
    buffer[buf_len] = '\0';

    int start_x = x;
    char *ptr = buffer;
    
    while (*ptr) {
        // Handle spaces
        if (*ptr == ' ') {
            x += gfx_GetCharWidth(' ');
            if (x > start_x + max_width) {
                x = start_x;
                y += 10;
            }
            ptr++;
            continue;
        }
        
        // Handle newlines if any
        if (*ptr == '\n') {
            x = start_x;
            y += 10;
            ptr++;
            continue;
        }
        
        // Find word length
        char *end = ptr;
        while (*end && *end != ' ' && *end != '\n') {
            end++;
        }
        
        char temp = *end;
        *end = '\0';
        
        int word_width = gfx_GetStringWidth(ptr);
        
        // Wrap word to next line if it exceeds max_width and we aren't already at start_x
        if (x + word_width > start_x + max_width && x > start_x) {
            x = start_x;
            y += 10;
        }
        
        gfx_PrintStringXY(ptr, x, y);
        x += word_width;
        
        *end = temp;
        ptr = end;
    }
    
    return y + 10;
}
