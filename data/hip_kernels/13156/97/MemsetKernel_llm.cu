#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the 1D index of the current thread
    int index = blockIdx.y * blockDim.y * w + blockIdx.x * blockDim.x + threadIdx.y * w + threadIdx.x;

    // Calculate the maximum size for the 1D grid
    int maxIndex = w * h;

    // Check if the thread's index is within bounds
    if (index < maxIndex)
    {
        image[index] = value;
    }
}