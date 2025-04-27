#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Use a unique seed for each block combined with thread index to increase randomness
    unsigned long long blockSeed = seed + blockIdx.x;
    hiprand_init(blockSeed, tidx, 0, &state[tidx]);
}