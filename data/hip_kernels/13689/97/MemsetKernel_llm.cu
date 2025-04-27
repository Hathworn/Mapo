#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use one-dimensional thread indexing to reduce calculations
    int pos = i * w + j;

    // Ensure thread index is within bounds
    if (pos < w * h)
    {
        image[pos] = value; // Assign value to image
    }
}