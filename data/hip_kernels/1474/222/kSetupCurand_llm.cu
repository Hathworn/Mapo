#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Compute global thread index more efficiently
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize CURAND state with minimal function call
    hiprand_init(seed, tidx, 0, &state[tidx]);
}