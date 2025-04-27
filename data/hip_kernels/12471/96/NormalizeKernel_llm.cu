#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if outside image bounds
    if (i >= h || j >= w) return;

    const int pos = i * s + j;
    float scale = normalization_factor[pos];

    // Avoid branch by adding small value to scale
    float invScale = 1.0f / (scale + 1e-7f);

    // Perform normalization
    image[pos] *= invScale;
}