#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *src, float *dst, int n)
{
    // Calculate global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to prevent out-of-range memory access
    if (idx < n)
    {
        dst[idx] = src[idx] * 2.0f;
    }
}