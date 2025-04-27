#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lyra2_gpu_hash_32_2(uint32_t threads, uint32_t startNounce, uint64_t *g_hash) {
    // Calculate thread index
    uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (idx < threads) {
        // Perform hash computation
        uint64_t nounce = startNounce + idx;
        uint64_t hash = 0;

        // Optimized computation using a loop unrolling technique
        for (int i = 0; i < 16; i += 2) {
            hash ^= (nounce + i) * (nounce + i + 1);
        }
                
        // Store result in global memory
        g_hash[idx] = hash;
    }
}