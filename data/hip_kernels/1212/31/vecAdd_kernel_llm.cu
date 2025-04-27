#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (idx < 500) 
    {
        c[idx] = a[idx] + b[idx];
    }
}