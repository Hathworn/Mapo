#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index for 1D array processing
    int pos = (blockIdx.y * blockDim.y + threadIdx.y) * s + blockIdx.x * blockDim.x + threadIdx.x;

    if (pos >= h * s || pos % s >= w) return; // Boundary check
    
    float scale = normalization_factor[pos];
    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale); // Avoid division by zero
    image[pos] *= invScale;
}