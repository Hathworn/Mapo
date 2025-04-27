#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *a, float *b, float *c)
{
    // Use thread ID to handle multiple elements
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    c[idx] = a[idx] + b[idx];
}