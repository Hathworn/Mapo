#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Use single calculation of thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid unnecessary computation when out of bounds
    if (i < h && j < w) 
    {
        const int pos = i * s + j;
        float scale = normalization_factor[pos];
        float invScale = __fdividef(1.0f, scale); // Use fast divide function
        image[pos] *= (scale == 0.0f ? 1.0f : invScale);
    }
}