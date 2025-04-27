#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the global thread ID
    const uint tidx = hipGridDim_x * blockIdx.x + threadIdx.x;
    
    // Initialize curand with optimized sequence
    hiprand_init(seed, tidx, 0, &state[tidx]);
}