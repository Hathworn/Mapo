#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized binarize kernel function
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation for thread index
    if (i < n)  // Adjusted if condition to reduce number of checks
    {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}