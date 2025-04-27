#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for optimization
    #pragma unroll 5
    for (int i = 0; i < 500; i++)
    {
        c[idx] = a[idx] + b[idx];
    }
}