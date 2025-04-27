#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Compute thread id using grid and block indices
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize CURAND state for each thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}