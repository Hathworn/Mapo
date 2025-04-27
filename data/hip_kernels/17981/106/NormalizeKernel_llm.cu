#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the global thread indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to ensure threads only operate on valid elements
    if (i < h && j < w)
    {
        const int pos = i * s + j;
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}