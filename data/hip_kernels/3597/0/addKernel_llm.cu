```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform bounds check to ensure threads don't access out-of-bounds memory
    if (i < N)    
    {
        // Perform addition
        c[i] = a[i] + b[i];
    }
}