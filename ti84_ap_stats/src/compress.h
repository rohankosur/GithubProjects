#ifndef COMPRESS_H
#define COMPRESS_H

#include <stdint.h>
#include <stddef.h>

extern const char *g_compression_dict[];
extern const uint8_t g_dict_size;

// Renders compressed string directly to screen using graphx
// Wraps text automatically. Returns the new Y coordinate.
int print_compressed_string(int x, int y, int max_width, const char *compressed_str, size_t len);

#endif
