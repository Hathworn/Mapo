#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index for 1D flattened 2D grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single index to reduce computation
    int pos = i * w + j;

    // Check bounds in a single condition
    if (pos < w * h) {
        image[pos] = value;
    }
}