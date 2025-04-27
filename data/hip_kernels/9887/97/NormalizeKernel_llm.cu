#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index
    int col = threadIdx.x + blockDim.x * blockIdx.x;
    int row = threadIdx.y + blockDim.y * blockIdx.y;

    // Bound checks to ensure correctness
    if (row < h && col < w) {
        const int pos = row * s + col;
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}