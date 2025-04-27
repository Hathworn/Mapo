#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure thread processes only valid elements
    if (i < h && j < w) 
    {
        const int pos = i * s + j;  // Compute position once

        // Directly compute inverse scale
        float invScale = (normalization_factor[pos] == 0.0f) ? 1.0f : (1.0f / normalization_factor[pos]);

        // Apply normalization
        image[pos] *= invScale;
    }
}