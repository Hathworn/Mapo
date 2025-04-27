#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread index
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    /* Initialize each thread with a unique seed and sequence number */
    hiprand_init(seed, tidx, 0, &state[tidx]);
}