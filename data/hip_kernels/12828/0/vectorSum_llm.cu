#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized CUDA kernel
__global__ void vectorSum(int *a, int *b, int *c, int n)
{
    // Compute the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread ID is within bounds and perform vector addition
    if (id < n)
    {
        c[id] = a[id] + b[id];
    }
}