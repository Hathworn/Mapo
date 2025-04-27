#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate unique global position within grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within valid boundary
    if (i < h && j < w) {
        // Compute 1D position for accessing image and normalization_factor arrays
        const int pos = i * s + j;

        // Retrieve normalization factor for current position
        float scale = normalization_factor[pos];

        // Compute and apply inverse scale factor
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}