#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(float *c, float *a, float *b, int size)
{
    // Compute global thread index for 2D grid of 2D blocks
    int i = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Use stride loop for efficient global memory access
    int stride = gridDim.x * blockDim.x * blockDim.y;

    while(i < size)
    {
        c[i] = a[i] + b[i];
        i += stride;
    }
}