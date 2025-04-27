#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique index for each thread
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize cuRAND state with optimized launch configuration
    hiprand_init(seed, tidx, 0, &state[tidx]);
}