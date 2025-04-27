#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the global thread index directly to reduce the number of arithmetic operations
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Quickly exit if the thread is out of bounds
    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    // Use a temporary variable to store the scale value to reduce memory access
    float scale = normalization_factor[pos];
    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

    // Perform the scaling operation
    image[pos] *= invScale;
}