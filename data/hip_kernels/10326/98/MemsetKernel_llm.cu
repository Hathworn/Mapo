#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the position using the grid-stride loop for efficient memory access
    for (int i = blockIdx.y * blockDim.y + threadIdx.y; i < h; i += blockDim.y * gridDim.y)
    {
        for (int j = blockIdx.x * blockDim.x + threadIdx.x; j < w; j += blockDim.x * gridDim.x)
        {
            const int pos = i * w + j;
            image[pos] = value;
        }
    }
}