#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Compute the global thread index
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure that the thread operates within matrix bounds
    if (i < h && j < w)
    {
        // Calculate linear index and set value
        const int pos = i * w + j;
        image[pos] = value;
    }
}