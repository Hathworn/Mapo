#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the global index with 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (i < n)
    {
        // Perform binarization
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}