#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Optimize memory access pattern
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Optimize memory access pattern

    if (i < h && j < w) // Use logical AND for conditional check
    {
        const int pos = i * w + j;
        image[pos] = value;
    }
}