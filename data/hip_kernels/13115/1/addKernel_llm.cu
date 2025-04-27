#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform addition if the index is within bounds
    if (i < N) // Assume N is the length of the arrays, defined elsewhere
    {
        c[i] = a[i] + b[i];
    }
}