#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread indices
    int j = blockIdx.x * blockDim.x + threadIdx.x; // x-dimension (width)
    int i = blockIdx.y * blockDim.y + threadIdx.y; // y-dimension (height)

    // Check if within image bounds
    if (i < h && j < w) {
        const int pos = i * s + j;

        float scale = normalization_factor[pos];
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

        // Apply normalization
        image[pos] *= invScale;
    }
}