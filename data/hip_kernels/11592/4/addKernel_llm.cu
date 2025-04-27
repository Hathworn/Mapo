#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index based on block and thread indices for scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform addition only if index is within bounds (assuming size of arrays is passed externally)
    // This requires block and grid configuration to be compatible with the array sizes
    if (i < N) 
    {
        c[i] = a[i] + b[i];
    }
}