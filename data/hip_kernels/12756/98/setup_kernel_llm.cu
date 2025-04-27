#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check to ensure within state array bounds
    if (i < gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &state[i]);
    }
}