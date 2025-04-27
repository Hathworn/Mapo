#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Use blockIdx.y and threadIdx.y for i
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Use blockIdx.x and threadIdx.x for j

    if (i < h && j < w) // Combine bounds check into one conditional
    {
        const int pos = i * s + j;
        float scale = normalization_factor[pos];

        // Use ternary and fused multiply-add to improve performance
        image[pos] *= (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale); 
    }
}