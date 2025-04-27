#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform addition only if index is within bounds
    if (i < N)  // Assume N is the size of the arrays
    {
        c[i] = a[i] + b[i];
    }
}