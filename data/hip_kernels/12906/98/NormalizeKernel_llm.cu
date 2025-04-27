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
    
    // Early exit to avoid redundant calculations
    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    float scale = normalization_factor[pos];

    // Use conditional operator for branchless computation
    float invScale = (scale != 0.0f) ? __fdividef(1.0f, scale) : 1.0f;

    image[pos] *= invScale; // Efficient multiplication
}