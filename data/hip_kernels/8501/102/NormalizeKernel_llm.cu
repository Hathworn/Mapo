#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the global position within the image.
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Check bounds to avoid accessing out of bounds memory.
    if (i < h && j < w)
    {
        const int pos = i * s + j;

        // Read normalization factor and compute inverse scale with ternary operator.
        float scale = normalization_factor[pos];
        float invScale = (scale != 0.0f) ? (1.0f / scale) : 1.0f;

        // Apply normalization to image at the calculated position.
        image[pos] *= invScale;
    }
}