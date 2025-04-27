#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure the thread is within array bounds
    if (i < n) {
        // Use ternary operator for binarization
        binary[i] = (x[i] >= 0.0f) ? 1.0f : -1.0f;
    }
}