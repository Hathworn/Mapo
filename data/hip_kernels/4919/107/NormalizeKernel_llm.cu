#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Calculate row index
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Calculate column index

    if (i < h && j < w)  // Combined boundary check
    {
        const int pos = i * s + j; // Compute the linear index

        float scale = normalization_factor[pos]; // Access normalization factor

        float invScale = (scale == 0.0f) ? 1.0f : __frcp_rd(scale); // Use fast reciprocal

        image[pos] *= invScale; // Apply normalization
    }
}