#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread position optimized using built-in variables
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads within image bounds
    if (i < h && j < w) {
        // Flattened array index
        const int pos = i * s + j;

        // Load normalization factor once
        float scale = normalization_factor[pos];

        // Calculate inverse scale and handle zero-scale case
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Apply normalization
        image[pos] *= invScale;
    }
}