#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the global thread index
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize CURAND state for each thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}