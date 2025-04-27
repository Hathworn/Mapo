#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by unrolling the loop
__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    #pragma unroll 10
    for (int i = 0; i < 500; i++)
        c[idx] = a[idx] + b[idx];
}