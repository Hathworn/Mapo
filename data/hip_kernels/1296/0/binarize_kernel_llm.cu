#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds
    if (i < n) 
    {
        // Perform binary operation
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}