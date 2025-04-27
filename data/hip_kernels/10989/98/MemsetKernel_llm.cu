#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global index for the thread
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (i < h && j < w) {
        // Compute 1D index from 2D coordinates
        const int pos = i * w + j;
        // Set image value at the computed index
        image[pos] = value;
    }
}