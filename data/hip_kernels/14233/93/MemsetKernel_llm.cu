#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Use a single index variable to minimize calculations
    int pos = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y) + blockDim.x * blockDim.y * blockIdx.x;

    // Prevent index out of bounds using an early exit
    if (pos >= w * h) return;

    image[pos] = value;
}