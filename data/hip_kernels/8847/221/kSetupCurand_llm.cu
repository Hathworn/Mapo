#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index once
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Initialize curand state with pre-calculated index
    hiprand_init(seed, tidx, 0, &state[tidx]);
}