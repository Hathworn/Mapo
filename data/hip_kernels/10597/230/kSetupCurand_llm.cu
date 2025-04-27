#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the unique thread index based on block and thread index
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize the curand state for each thread with different sequence numbers
    hiprand_init(seed, tidx, 0, &state[tidx]);
}