#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread id
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize RNG state for this thread with a unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}