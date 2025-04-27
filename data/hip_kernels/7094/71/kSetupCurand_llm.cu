#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use a block-wide stride to reduce launch overhead
    for (uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
         tidx < NUM_RND_THREADS_PER_BLOCK * gridDim.x; 
         tidx += blockDim.x * gridDim.x) {
        hiprand_init(seed, tidx, 0, &state[tidx]); // Initialize each state
    }
}