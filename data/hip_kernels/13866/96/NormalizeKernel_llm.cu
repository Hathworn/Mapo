#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate linear index from 2D grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (i < h && j < w) {
        int pos = i * s + j; // Calculate position index

        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale; // Normalize the image
    }
}