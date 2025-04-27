#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the unique global thread index
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize curand state with unique seed and sequence
    hiprand_init(seed, tidx, 0, &state[tidx]);
}