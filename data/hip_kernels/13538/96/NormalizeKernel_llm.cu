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

    // Check bounds and early return optimization
    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    // Use conditional operator to reduce divergence
    float scale = normalization_factor[pos];
    image[pos] *= (scale == 0.0f) ? 1.0f : (1.0f / scale);
}