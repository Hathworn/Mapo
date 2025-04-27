#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Optimize by ensuring the operation is only performed for valid thread indices
    if(tidx < NUM_RND_THREADS_PER_BLOCK * gridDim.x) {
        hiprand_init(seed, tidx, 0, &state[tidx]);
    }
}