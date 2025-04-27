#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x; // Compute global thread index
    hiprand_init(seed, tidx, 0, &state[tidx]); // Initialize each thread's curand state
}