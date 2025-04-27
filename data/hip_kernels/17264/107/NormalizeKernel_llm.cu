#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global index once to avoid repetitive computation
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Check bounds
    if (i < h && j < w) {
        // Calculate position index
        const int pos = i * s + j;
        
        // Read normalization factor
        float scale = normalization_factor[pos];

        // Avoid dividing by zero
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Scale image value
        image[pos] *= invScale;
    }
}