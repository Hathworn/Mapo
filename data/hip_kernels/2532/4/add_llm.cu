#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *a, float *b, int nx, int ny)
{
    // Calculate the linear index directly
    int idx = blockIdx.x * blockDim.x + threadIdx.x 
            + (blockIdx.y * blockDim.y + threadIdx.y) * nx;
            
    // Check within bounds and perform computation
    if (blockIdx.x * blockDim.x + threadIdx.x < nx && blockIdx.y * blockDim.y + threadIdx.y < ny) 
    {
        b[idx] += a[idx] * 0.125f;  // Use float literal for precise computation
    }
}