#include "hip/hip_runtime.h"
#include "includes.h"
#define NOMINMAX

const unsigned int BLOCK_SIZE = 512;

__global__ void addKernel(float *c, const float *a, const float *b)
{
    // Calculate global index using block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (i < BLOCK_SIZE)
    {
        c[i] = a[i] + b[i];
    }
}