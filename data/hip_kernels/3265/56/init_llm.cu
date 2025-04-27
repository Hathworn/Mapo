#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with a simple operation example
__global__ void optimizedKernel(float* data, int n) {
    // Get unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds
    if (idx < n) {
        // Simple operation for demonstration
        data[idx] = static_cast<float>(idx);
    }
}