#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate 1D index from 2D grid
    int pos = (blockIdx.y * blockDim.y + threadIdx.y) * w + (blockIdx.x * blockDim.x + threadIdx.x);

    // Flattened boundary check
    if (pos < w * h) 
    {
        image[pos] = value;
    }
}