#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index for 1D flattened image array
    int pos = (blockIdx.y * blockDim.y + threadIdx.y) * w + (blockIdx.x * blockDim.x + threadIdx.x;

    // Only proceed if within bounds
    if (pos < w * h)
    {
        image[pos] = value; // Set image pixel value
    }
}