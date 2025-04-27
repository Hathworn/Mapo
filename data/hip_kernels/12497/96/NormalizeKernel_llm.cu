#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the global thread index in both directions
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to potentially store normalization factors if beneficial (depends on specific use case)
    __shared__ float shared_norm_factor[/* specify size if using shared memory */];

    // Ensure thread indices are within valid range
    if (i < h && j < w) {
        const int pos = i * s + j;

        // Load normalization factor into a variable, can also use shared memory if applicable
        float scale = normalization_factor[pos];

        // Compute inverse scale, handle zero scaling, and apply
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}