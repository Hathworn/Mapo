#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the unique thread index
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a unique seed for each thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}