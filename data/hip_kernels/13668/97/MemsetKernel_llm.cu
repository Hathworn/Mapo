#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit for out of bounds threads
    if (i >= h || j >= w) return;

    const int pos = i * w + j;
    
    // Avoid unnecessary memory fetches
    image[pos] = value;
}