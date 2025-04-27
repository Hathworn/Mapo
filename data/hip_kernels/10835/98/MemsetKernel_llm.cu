#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

// Optimize memory coalescing and boundary checking
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (row < h && col < w) { // Only proceed if within bounds
        int index = row * w + col;
        image[index] = value;
    }
}