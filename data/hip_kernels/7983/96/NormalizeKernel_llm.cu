#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;  // Index calculation
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < h && j < w)  // Boundary check
    {
        const int pos = i * s + j;  // Memory position calculation

        float scale = normalization_factor[pos];  // Read normalization factor

        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);  // Invert normalization factor

        image[pos] *= invScale;  // Normalize image
    }
}