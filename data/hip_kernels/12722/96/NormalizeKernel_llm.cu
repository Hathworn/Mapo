#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Bound check to ensure threads operate within image dimensions
    if (i < h && j < w) {
        const int pos = i * s + j;

        // Avoid branch by using a multiplier
        float scale = normalization_factor[pos];        
        float invScale = (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale); // Use fast division

        // Apply normalization
        image[pos] *= invScale;
    }
}