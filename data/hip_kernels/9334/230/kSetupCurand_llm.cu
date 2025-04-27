#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the global thread ID for better memory access patterns
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize the random number generator state for this thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}