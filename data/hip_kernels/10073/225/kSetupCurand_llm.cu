#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use local variable for tidx to minimize repeated calculation
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Initialize hiprand with optimized sequence number calculation
    hiprand_init(seed, tidx, 0, &state[tidx]);
}