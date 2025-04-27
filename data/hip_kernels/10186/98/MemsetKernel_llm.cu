#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure thread operates within bounds
    if (i < h && j < w)
    {
        // Calculate position once and directly assign value
        const int pos = i * w + j;
        image[pos] = value;
    }
}