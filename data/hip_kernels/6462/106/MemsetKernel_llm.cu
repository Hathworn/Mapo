#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Use a single-dimensional thread index for coalesced memory access
    int globalIdx = i * w + j;

    // Ensure within bounds
    if (i < h && j < w) {
        image[globalIdx] = value;
    }
}