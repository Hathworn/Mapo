#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the global thread index once to avoid recomputation
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Each thread gets the same seed with different sequence number and no offset
    hiprand_init(seed, tidx, 0, &state[tidx]);
}