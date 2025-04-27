#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary conditions for early exit
    if (i < h && j < w)
    {
        const int pos = i * s + j;

        // Load scale once from global memory
        float scale = normalization_factor[pos];

        // Use ternary operator for conditional scaling
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

        // Multiply the image value by invScale
        image[pos] *= invScale;
    }
}