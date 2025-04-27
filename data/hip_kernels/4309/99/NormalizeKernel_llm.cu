#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate 2D index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return if out of bounds
    if (i >= h || j >= w) return;

    // Compute linear position
    const int pos = i * s + j;

    // Load normalization factor
    float scale = normalization_factor[pos];

    // Inverse scale using ternary operator for clarity and efficiency
    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

    // Scale the image value
    image[pos] *= invScale;
}