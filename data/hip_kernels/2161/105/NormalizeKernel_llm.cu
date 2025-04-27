#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Optimize by using a single calculation for thread and block indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (i < h && j < w) {
        int pos = i * s + j;
        
        // Read normalization factor
        float scale = normalization_factor[pos];
        
        // Compute inverse scale, handling zero case
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        
        // Apply normalization
        image[pos] *= invScale;
    }
}