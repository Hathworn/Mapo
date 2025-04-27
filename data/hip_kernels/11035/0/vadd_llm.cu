#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized vadd kernel

__global__ void vadd(const float *a, const float *b, float *c, int n)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n) // Ensure within bounds
    {
        c[i] = a[i] + b[i];
    }
}