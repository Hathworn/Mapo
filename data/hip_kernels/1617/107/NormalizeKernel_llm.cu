#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Use blockIdx.y and blockDim.y for better readability
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Use blockIdx.x and blockDim.x for better readability

    if (i < h && j < w) // Use logical 'and' for better clarity
    {
        const int pos = i * s + j;

        float scale = normalization_factor[pos];

        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f; // Use '!=' for better readability

        image[pos] *= invScale;
    }
}