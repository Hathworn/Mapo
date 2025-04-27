#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread ID for 2D grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Conditional check for valid index in bounds
    if (i < h && j < w)
    {
        // Calculate linear index
        int pos = i * w + j;
        // Set value in image
        image[pos] = value;
    }
}