#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (i < h && j < w)
    {
        const int pos = i * s + j;

        float scale = normalization_factor[pos];

        // Inline conditional for inverse scale
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

        image[pos] *= invScale;
    }
}