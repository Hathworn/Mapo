#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use unsigned int for tidx calculation to save some computation
    unsigned int tidx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize each thread's state by utilizing faster register storage
    hiprand_init(seed, tidx, 0, &state[tidx]);
}