#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void final_mark_starts(uint8_t *hashes, uint32_t *sort_indices, uint32_t *off_map, uint32_t r, uint32_t hash_count)
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;
    if (t_index < hash_count) {
        // Optimize calculation of previous index using conditional operator for efficiency
        uint32_t t_prev_index = t_index == 0 ? hash_count - 1 : t_index - 1;

        uint32_t index = sort_indices[t_index];
        uint32_t prev_index = sort_indices[t_prev_index];

        // Pre-calculate hash offset, removing multiplication with sizeof(unsigned char) as it's 1
        unsigned char* hash = hashes + index * 30 + r * 3;
        unsigned char* prev_hash = hashes + prev_index * 30 + r * 3;

        // Unroll hash key calculation for potential compiler optimization
        uint64_t key = ((uint64_t)hash[0]) << 40 | ((uint64_t)hash[1]) << 32 | ((uint64_t)hash[2]) << 24
                     | ((uint64_t)hash[3]) << 16 | ((uint64_t)hash[4]) << 8 | hash[5];

        uint64_t prev_key = ((uint64_t)prev_hash[0]) << 40 | ((uint64_t)prev_hash[1]) << 32 | ((uint64_t)prev_hash[2]) << 24
                          | ((uint64_t)prev_hash[3]) << 16 | ((uint64_t)prev_hash[4]) << 8 | prev_hash[5];

        // Use direct assignment with a conditional check to minimize operations
        off_map[t_index] = (key ^ prev_key) != 0 ? 1 : 0;
    }
}