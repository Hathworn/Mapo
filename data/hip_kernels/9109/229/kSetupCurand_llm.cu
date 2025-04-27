#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index for non-overlapping seed sequences
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize CURAND state with calculated sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}