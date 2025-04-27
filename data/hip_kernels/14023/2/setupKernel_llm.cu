#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to initialize the RNG state
__global__ void setupKernel(hiprandState *state, unsigned long long seed) {
    // Compute the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize random number generator state
    hiprand_init(seed, idx, 0, &state[idx]);
}