#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure thread is within image bounds
    if (i < h && j < w) {
        const int pos = i * s + j;

        float scale = normalization_factor[pos];

        // Use ternary operator for inversion, avoiding division by zero
        float invScale = (scale == 0.0f) ? 1.0f : __frcp_rn(scale);

        // Perform normalization
        image[pos] *= invScale;
    }
}