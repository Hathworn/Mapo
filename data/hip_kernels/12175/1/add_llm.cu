#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Use thread ID to allow vectorized operations for larger arrays
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition on each element assuming arrays not scalars
    c[idx] = a[idx] + b[idx];
}