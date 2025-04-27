#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Efficient parallel initialization using shared memory to reduce global memory access
    __shared__ hiprandState localState[NUM_RND_THREADS_PER_BLOCK];
    
    // Initialize state in shared memory
    hiprand_init(seed, tidx, 0, &localState[threadIdx.x]);
    
    // Copy state from shared to global memory
    state[tidx] = localState[threadIdx.x];
}