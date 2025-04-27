```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Flatten thread indexing

    if (tid < n) // Check within array bounds
    {
        if (a[tid] <= b[tid])
        {
            c[tid] = a[tid];
        }
        else
        {
            c[tid] = b[tid];
        }
    }
}