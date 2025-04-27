#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread ID for better efficiency and clarity
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize the random number generator with improved indexing
    hiprand_init(seed, tidx, 0, &state[tidx]);
}