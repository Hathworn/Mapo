#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cubic(float* d_out, float* d_in)
{
    // Use blockIdx and blockDim for larger input arrays
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within bounds before accessing memory
    if (idx < N) 
    {
        float f = d_in[idx];
        d_out[idx] = f * f * f; // Compute cube more efficiently
    }
}