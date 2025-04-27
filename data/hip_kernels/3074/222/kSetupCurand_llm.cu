#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use blockDim.x for dynamic thread handling
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize each state with a unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}