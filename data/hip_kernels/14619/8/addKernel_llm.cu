#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index for the current thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure index is within array bounds before performing addition
    if (i < array_size) 
    {
        c[i] = a[i] + b[i];
    }
}