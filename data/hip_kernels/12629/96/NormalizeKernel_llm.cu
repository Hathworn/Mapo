#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the global thread index for both dimensions
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional return to exit early for out-of-bound threads
    if (i >= h || j >= w) return;

    int pos = i * s + j;

    // Pre-compute inverse scale with a ternary operator for succinctness
    float invScale = (normalization_factor[pos] != 0.0f) ? (1.0f / normalization_factor[pos]) : 1.0f;

    // Apply normalization directly
    image[pos] *= invScale;
}