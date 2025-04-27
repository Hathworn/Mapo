#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use blockDim.x directly for better readability
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize each curand state with a unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}