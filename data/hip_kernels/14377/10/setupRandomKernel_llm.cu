#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel
__global__ void setupRandomKernel(hiprandState* states, unsigned long long seed) {
    // Calculate global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Initialize random state for the current thread
    if (tid < gridDim.x * blockDim.x) { // Boundary check to prevent out-of-bounds access
        hiprand_init(seed, tid, 0, &states[tid]);
    }
}