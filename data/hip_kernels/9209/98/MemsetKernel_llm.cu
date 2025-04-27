#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Use built-in variables to simplify index calculation
    int i = hipBlockIdx_y * hipBlockDim_y + hipThreadIdx_y;
    int j = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Ensure threads outside the bounds do not execute further
    if (i < h && j < w) {
        // Calculate the linear index once and directly set the value
        image[i * w + j] = value;
    }
}