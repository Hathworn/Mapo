#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *a, int *b, int *c, int N)
{
    // Calculate global index for threads
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds check to avoid illegal memory access
    if (i < N)
    {
        c[i] = a[i] + b[i];
    }
}