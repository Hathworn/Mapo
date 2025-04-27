```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Each thread gets a unique seed, different sequence number
    hiprand_init(seed, tidx, tidx, &state[tidx]);
}