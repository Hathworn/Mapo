#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Add vectors
    c[idx] = a[idx] + b[idx];
}