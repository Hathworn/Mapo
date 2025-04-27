#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Preload dimensions to avoid redundant global memory access
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional logic to prevent out-of-bound access
    if (i < h && j < w) 
    {
        const int pos = i * s + j;

        // Use a ternary operator for concise inversion logic
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Perform in-place scaling operation
        image[pos] *= invScale;
    }
}