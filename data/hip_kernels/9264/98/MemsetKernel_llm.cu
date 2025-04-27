#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Calculate global row index
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global column index
    
    if (i < h && j < w) { // Ensure within bounds
        const int pos = i * w + j; // Compute linear index
        image[pos] = value; // Assign value
    }
}