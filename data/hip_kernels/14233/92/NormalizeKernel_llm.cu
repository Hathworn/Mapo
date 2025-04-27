#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread is within bounds
    if (i < h && j < w)
    {
        const int pos = i * s + j;
        
        // Use ternary operator for efficient scale inversion
        float scale = normalization_factor[pos];
        float invScale = (scale != 0.0f) ? __frcp_rn(scale) : 1.0f;

        // Apply normalization
        image[pos] *= invScale;
    }
}