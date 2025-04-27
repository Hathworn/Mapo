#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *src, float *dst)
{
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < gridDim.x * blockDim.x)  // Ensure index is within bounds
    {
        dst[idx] = src[idx] * 2.0f;   // Efficient memory access
    }
}