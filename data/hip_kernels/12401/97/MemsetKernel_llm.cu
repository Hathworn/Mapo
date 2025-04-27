#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Use 2D threadblock and grid for better memory access pattern
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < h && j < w) // Combined bounds check for efficiency
    {
        const int pos = i * w + j;
        image[pos] = value;
    }
}