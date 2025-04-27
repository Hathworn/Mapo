#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Use blockDim.x for thread calculations to enhance performance
    hiprand_init(seed, tidx, 0, &state[tidx]);
}