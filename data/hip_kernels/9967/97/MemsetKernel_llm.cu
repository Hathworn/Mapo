#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate linear thread index globally
    int globalIndex = blockIdx.y * blockDim.y * w + threadIdx.y * w + blockIdx.x * blockDim.x + threadIdx.x;
    
    if (globalIndex >= w * h) return;
    
    // Set value using linear thread index
    image[globalIndex] = value;
}