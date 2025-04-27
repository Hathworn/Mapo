#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate thread id using block-level abstractions
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize curand state with distinct sequence
    hiprand_init(seed, tidx, 0, &state[tidx]);
}