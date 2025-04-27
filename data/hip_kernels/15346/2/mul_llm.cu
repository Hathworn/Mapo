#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void mul(int *a, int *b, int *c)
{
    // Use block and thread indices for parallel computation
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform bounds checking
    if (index == 0) 
    {
        *c = *a * *b;
    }
}