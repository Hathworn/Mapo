#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index for unique sequence
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Each thread gets a different sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}