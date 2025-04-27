#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Each thread uses unique seed — improving randomness slightly
    hiprand_init(seed + tidx, tidx, 0, &state[tidx]);
}