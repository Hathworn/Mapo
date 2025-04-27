#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure the index is within bounds before initializing
    if (i < gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &state[i]);
    }
}