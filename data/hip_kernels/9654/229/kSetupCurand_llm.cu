#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized initialization of curand state for each thread
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread index across all blocks
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize each thread with the curand seed and sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}