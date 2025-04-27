#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Avoid redundant calculations by computing the state pointer once
    hiprandState* localState = &state[tidx];

    // Initialize random generator state; each thread uses unique sequence
    hiprand_init(seed, tidx, 0, localState);
}