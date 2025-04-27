#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = hipBlockDim_x * blockIdx.x + threadIdx.x;
    // Replace macro with hipBlockDim_x for better readability
    hiprand_init(seed, tidx, 0, &state[tidx]);
}