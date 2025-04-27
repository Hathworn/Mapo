#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Optimize memory access by using shared memory state
    __shared__ hiprandState sharedState[NUM_RND_THREADS_PER_BLOCK];
    // Initialize RNG in shared memory
    hiprand_init(seed, tidx, 0, &sharedState[threadIdx.x]);
    // Copy shared RNG state to global memory
    state[tidx] = sharedState[threadIdx.x];
}