#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void final_mark_starts( uint8_t *hashes, uint32_t *sort_indices, uint32_t *off_map, uint32_t r, uint32_t hash_count)
{
    // Calculate the global thread index
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;
    if(t_index < hash_count) {
        uint32_t t_prev_index = (t_index + hash_count - 1) % hash_count; // Better wrap around
        uint32_t index = sort_indices[t_index];
        uint32_t prev_index = sort_indices[t_prev_index];

        // Use pointers to access hashes more efficiently
        unsigned char* hash = hashes + index * 30 + r * 3;
        unsigned char* prev_hash = hashes + prev_index * 30 + r * 3;

        // Consolidate key and prev_key computation in one step for efficiency
        uint64_t key = ((uint64_t)hash[0] << 40) | ((uint64_t)hash[1] << 32) | (hash[2] << 24) | (hash[3] << 16) | (hash[4] << 8) | hash[5];
        uint64_t prev_key = ((uint64_t)prev_hash[0] << 40) | ((uint64_t)prev_hash[1] << 32) | (prev_hash[2] << 24) | (prev_hash[3] << 16) | (prev_hash[4] << 8) | prev_hash[5];

        // Use ^ to compare keys, update off_map if necessary
        if((key ^ prev_key) != 0) {
            off_map[t_index] = 1;
        }
    }
}