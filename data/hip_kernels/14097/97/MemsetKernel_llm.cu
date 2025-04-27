#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global index instead of individual i and j
    int idx = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y) + blockIdx.x * blockDim.x * blockDim.y;

    if (idx >= w * h) return;  // Ensure index is within bounds

    image[idx] = value;  // Set the value directly by global index
}