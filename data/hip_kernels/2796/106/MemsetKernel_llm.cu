#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Compute global thread index in x and y directions
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds check to ensure index is within limits
    if (i < h && j < w) {
        // Compute linear index and set value
        const int pos = i * w + j;
        image[pos] = value;
    }
}