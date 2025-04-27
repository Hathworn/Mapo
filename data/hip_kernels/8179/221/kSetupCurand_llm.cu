```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the unique thread index
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize the CURAND state
    hiprand_init(seed, tidx, 0, &state[tidx]);
}