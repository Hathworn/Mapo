```c
#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate unique thread index within the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within matrix boundaries
    if (idx < w && idy < h) {
        const int pos = idy * w + idx; // Compute linear position for 2D array
        image[pos] = value; // Set the value
    }
}