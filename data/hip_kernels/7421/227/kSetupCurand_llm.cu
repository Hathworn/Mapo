#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Compute global thread index
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Initialize curand for each thread with unique sequence
    hiprand_init(seed, tidx, 0, &state[tidx]);
}