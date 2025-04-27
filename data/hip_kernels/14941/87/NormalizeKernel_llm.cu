#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index for x and y
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Return if out of bounds
    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    // Inline variable assignment to avoid intermediate create and calculate inverse in one line
    float invScale = (normalization_factor[pos] == 0.0f) ? 1.0f : (1.0f / normalization_factor[pos]);
    
    // Directly multiply scaled value
    image[pos] *= invScale;
}