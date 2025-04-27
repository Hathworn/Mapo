#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate 1D thread index for coalesced memory access
    int idx = blockIdx.y * blockDim.y * s + threadIdx.y * s + blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= h * s) return; // Check bounds using 1D index

    float scale = normalization_factor[idx];
    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
    image[idx] *= invScale;
}