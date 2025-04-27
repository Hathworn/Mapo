#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Using block and thread indices for parallel computation
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure the index is within bounds
    if (index < 1) 
    {
        c[index] = a[index] + b[index];
    }
}