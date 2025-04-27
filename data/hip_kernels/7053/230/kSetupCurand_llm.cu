#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    
    // Optimize by ensuring this kernel only runs for active threads
    if (tidx < TOTAL_NUM_RND_THREADS) {
        hiprand_init(seed, tidx, 0, &state[tidx]);
    }
}