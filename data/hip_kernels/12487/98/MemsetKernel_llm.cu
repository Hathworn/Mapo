#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x + 
                (blockIdx.y * blockDim.y + threadIdx.y) * w;

    // Ensure the thread is within bounds
    if (index < w * h) {
        image[index] = value;
    }
}