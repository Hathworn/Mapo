#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within image boundaries
    if (i < h && j < w) 
    {
        // Compute position index
        const int pos = i * s + j;

        // Load normalization factor and compute inverse
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale); // Fast reciprocal

        // Normalize the image
        image[pos] *= invScale;
    }
}