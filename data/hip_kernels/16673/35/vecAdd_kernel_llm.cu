#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    // Calculate global index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary repeated calculations
    float sum = a[idx] + b[idx];
    for (int i = 0; i < 500; i++)
    {
        c[idx] = sum;
    }
}