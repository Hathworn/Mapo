#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Utilize block and thread indices to support parallel execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out of bounds
    if (idx == 0)
    {
        c[idx] = a[idx] + b[idx];
    }
}