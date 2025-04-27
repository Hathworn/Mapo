#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void map_index_to_prefix( uint8_t *hashes, uint32_t *sort_indices, uint32_t *comb_count, uint32_t *comb_sum, uint32_t *comb_prefix, uint32_t r, uint32_t size)
{
    uint32_t t_index = blockDim.x * blockIdx.x + threadIdx.x;
    if(t_index < size) {
        // Load frequently used values into registers
        uint32_t index = sort_indices[t_index];
        unsigned char* hash = hashes + index * 30 + r * 3;
        uint32_t key = (hash[0] << 16) | (hash[1] << 8) | hash[2];
        
        uint32_t count = comb_count[key];
        uint32_t sum = comb_sum[key];
        
        // Use shared memory for comb_prefix to reduce memory latency
        __shared__ uint32_t shared_comb_prefix[BLOCK_SIZE];
        for(int i = threadIdx.x; i < (sum - count); i += blockDim.x) {
            shared_comb_prefix[i] = key;
        }
        
        // Write back to global memory
        for(int i = sum - count + threadIdx.x; i < sum; i += blockDim.x) {
            comb_prefix[i] = shared_comb_prefix[i - (sum - count)];
        }
    }
}