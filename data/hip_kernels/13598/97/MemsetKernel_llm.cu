#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate unique thread index in the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if out of bounds
    if (idx >= w || idy >= h) return;

    // Compute linear memory location
    const int pos = idy * w + idx;

    // Assign the value
    image[pos] = value;
}