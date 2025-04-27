#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread does not work on out-of-bounds data
    if (i < h && j < w)
    {
        const int pos = i * s + j;

        float scale = normalization_factor[pos];

        // Use ternary operation to avoid division by zero
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

        // Directly update the image value with the calculated inverse scale
        image[pos] *= invScale;
    }
}