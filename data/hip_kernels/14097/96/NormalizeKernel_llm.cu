#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index once
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Early exit for out-of-bounds threads
    if (i >= h || j >= w) return;
    
    // Calculate position index for accessing arrays
    const int pos = i * s + j;

    // Directly use ternary operator for normalization factor scaling
    float invScale = (normalization_factor[pos] == 0.0f) ? 1.0f : (1.0f / normalization_factor[pos]);

    image[pos] *= invScale; // Apply normalization
}