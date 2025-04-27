#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    // Calculate global index for thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure work is done only within array bounds
    if(i < N)
    {
        c[i] = a[i] + b[i];
    }
}