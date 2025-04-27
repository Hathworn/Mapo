#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void final_mark_starts(uint8_t *hashes, uint32_t *sort_indices, uint32_t *off_map, uint32_t r, uint32_t hash_count) {
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread index is within bounds
    if(t_index >= hash_count) return;

    uint32_t t_prev_index = (t_index == 0) ? (hash_count - 1) : (t_index - 1);

    uint32_t index = sort_indices[t_index];
    uint32_t prev_index = sort_indices[t_prev_index];

    // Simplified pointer arithmetic
    unsigned char* hash = hashes + index * 30 + r * 3;
    unsigned char* prev_hash = hashes + prev_index * 30 + r * 3;

    // Use bitwise operations to create key
    uint64_t key = *reinterpret_cast<const uint64_t*>(hash) & 0xFFFFFF000000;
    uint64_t prev_key = *reinterpret_cast<const uint64_t*>(prev_hash) & 0xFFFFFF000000;

    // Identify off_map if keys differ
    if(key != prev_key) {
        off_map[t_index] = 1;
    }
}