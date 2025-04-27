```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void final_map_index_to_prefix(uint8_t *hashes, uint32_t *sort_indices, uint32_t *off_map, uint32_t *comb_count, uint32_t *comb_sum, uint32_t *comb_prefix, uint32_t r, uint32_t size) 
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (t_index >= size) return;

    uint32_t index = sort_indices[t_index];
    unsigned char *hash = hashes + index * 30 + r * 3;  // Eliminate redundant sizeof

    // Compactly combine bytes into a 64-bit key
    uint64_t key = ((uint64_t)hash[0] << 40) | ((uint64_t)hash[1] << 32) | (hash[2] << 24) |
                   (hash[3] << 16) | (hash[4] << 8)  | hash[5];

    uint32_t lookup_idx = off_map[t_index];
    uint64_t count = comb_count[lookup_idx];
    uint64_t sum = comb_sum[lookup_idx];

    // Use a single assignment to avoid potential race conditions
    uint64_t start = sum - count;
    for (uint64_t i = start; i < sum; i++) {
        comb_prefix[i] = lookup_idx;
    }
}