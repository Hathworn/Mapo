#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary) 
{
    // Calculate global index using single grid dimension
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries
    if (i < n) 
    {
        // Use conditional assignment for binarization
        binary[i] = (x[i] >= 0.0f) ? 1.0f : -1.0f;
    }
}