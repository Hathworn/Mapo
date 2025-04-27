#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate a unique index for each thread
    int index = blockIdx.y * blockDim.y * w + blockIdx.x * blockDim.x + threadIdx.y * w + threadIdx.x;

    // Flattened index is valid only within the bounds
    if (index < w * h) {
        image[index] = value;
    }
}