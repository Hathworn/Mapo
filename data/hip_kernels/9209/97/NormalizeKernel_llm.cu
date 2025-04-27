#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Compute the thread's unique position in the image
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Return early if the thread is out of bounds
    if (i >= h || j >= w) return;

    // Calculate position in the flattened image array
    const int pos = i * s + j;

    // Retrieve normalization factor and compute inverse scale safely
    float scale = normalization_factor[pos];
    float invScale = __fdividef(1.0f, scale + (scale == 0.0f));

    // Perform normalization by scaling the image value
    image[pos] *= invScale;
}