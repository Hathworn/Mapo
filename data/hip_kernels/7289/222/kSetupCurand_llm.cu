#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread ID across the whole grid
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize curand state - parallelized across threads
    hiprand_init(seed, tidx, 0, &state[tidx]);
}