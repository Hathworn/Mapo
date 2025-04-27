#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x; // Simplified thread index calculation
    hiprand_init(seed, tidx, 0, &state[tidx]); // Initialize curand state
}