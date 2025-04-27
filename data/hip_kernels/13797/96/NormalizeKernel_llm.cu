#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread index for 2D grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within image bounds
    if (i < h && j < w) {
        // Linearize 2D coordinate to 1D for accessing arrays
        const int pos = i * s + j;

        // Avoid divide by zero
        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Normalize pixel value
        image[pos] *= invScale;
    }
}