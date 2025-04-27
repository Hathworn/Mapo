#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Exit if the thread index is out of bounds
    if (i < h && j < w) {
        int pos = i * w + j;
        image[pos] = value;
    }
}