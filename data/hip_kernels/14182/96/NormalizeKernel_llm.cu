#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Early exit for out-of-bounds threads
    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    // Load scale and compute inverse only once; avoid branching
    float scale = normalization_factor[pos];
    float invScale = (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale);

    image[pos] *= invScale;
}