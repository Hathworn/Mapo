#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Optimize index calculation for i
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation for j

    if (i < h && j < w) { // Combine boundary check and processing
        const int pos = i * s + j; // Avoid recalculating 'pos'
        float scale = normalization_factor[pos];
        float invScale = 1.0f / (scale + (scale == 0.0f)); // Prevent division by zero, optimize condition
        image[pos] *= invScale; // Simplify scaling operation
    }
}