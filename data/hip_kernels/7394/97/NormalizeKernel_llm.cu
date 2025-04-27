#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Return early if the thread is out of image bounds
    if (i >= h || j >= w) return;

    const int pos = i * s + j;
    float scale = normalization_factor[pos];
    
    // Use a ternary operator for conditionally computing inverse scale
    float invScale = (scale != 0.0f) ? 1.0f / scale : 1.0f;

    // Multiply image by inverse scale
    image[pos] *= invScale;
}