#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the thread index once to improve efficiency.
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    
    // Initialize the random state for each thread without repeated calculation.
    hiprand_init(seed, tidx, 0, &state[tidx]);
}