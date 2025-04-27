#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate i and j using built-in 2D block and thread indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for out-of-bound indices, reducing warp divergence
    if (i < h && j < w) {
        const int pos = i * s + j;

        // Load scale once to reduce memory access
        float scale = normalization_factor[pos];
        
        // Perform normalization using pre-computed inverse scale
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;
        
        image[pos] *= invScale;
    }
}