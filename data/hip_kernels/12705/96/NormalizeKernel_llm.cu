#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Early return if out of the processing bounds
    if (i >= h || j >= w) return;

    // Calculate position index
    int pos = i * s + j;

    // Load normalization factor
    float scale = normalization_factor[pos];

    // Compute inverse scale safely
    float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

    // Scale image at current position
    image[pos] *= invScale;
}