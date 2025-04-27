#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use HIP built-in intrinsics for efficiency
    hiprand_init(seed, tidx, 0, &state[tidx]);
}