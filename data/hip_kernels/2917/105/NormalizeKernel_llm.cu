#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float* __restrict__ normalization_factor, int w, int h, int s, float* __restrict__ image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < h && j < w) // Reorder condition to enhance readability
    {
        const int pos = i * s + j;
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}