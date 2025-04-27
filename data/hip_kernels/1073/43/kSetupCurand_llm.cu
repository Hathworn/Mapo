#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index with block-wise distribution
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize each thread with a unique sequence number for random numbers
    hiprand_init(seed, tidx, 0, &state[tidx]);
}