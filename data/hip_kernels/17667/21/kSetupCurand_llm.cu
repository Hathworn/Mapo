#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Optimize kernel launch: process only active threads
    if (tidx < NUM_RND_THREADS_PER_BLOCK * gridDim.x) {
        // Each thread gets unique sequence number for variance
        hiprand_init(seed, tidx, 0, &state[tidx]);
    }
}