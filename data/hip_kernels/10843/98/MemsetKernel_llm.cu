#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global index
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    int i = blockDim.y * blockIdx.y + threadIdx.y;

    // Use early exit for threads outside of bounds
    if (i < h && j < w) {
        int pos = i * w + j; // Calculate linear index
        image[pos] = value; // Set value
    }
}