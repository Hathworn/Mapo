#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized setup_kernel function
__global__ void setup_kernel (hiprandState *state, unsigned long seed) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < gridDim.x * blockDim.x) { // Ensure within bounds
        hiprand_init(seed, i, 0, &state[i]);
    }
}