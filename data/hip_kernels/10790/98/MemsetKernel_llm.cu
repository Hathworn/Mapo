#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global row index
    int j = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global column index

    if (i >= h || j >= w) return;  // Bounds check

    const int pos = i * w + j;  // Calculate linear memory index

    image[pos] = value;  // Set image pixel value
}