#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize each thread with same seed, unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}