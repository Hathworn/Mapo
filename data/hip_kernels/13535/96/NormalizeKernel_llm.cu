#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index for accessing image data
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Boundary check to ensure we only process valid elements
    if (j < w && i < h) {
        const int pos = i * s + j;
        
        // Safely calculate the inverse scale factor
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : __frcp_rn(scale);  // Use reciprocal function for better performance
        
        // Apply normalization
        image[pos] *= invScale;
    }
}