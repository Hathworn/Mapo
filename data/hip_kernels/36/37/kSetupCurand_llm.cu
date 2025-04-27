#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Use hiprand_init with unique sequence numbers for each block and thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}