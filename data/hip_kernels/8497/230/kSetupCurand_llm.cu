#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index more efficiently
    hiprand_init(seed, tidx, 0, &state[tidx]); // Initialize curand state with calculated index
}