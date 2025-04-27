#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if thread is out of bounds
    if (i < h && j < w) {
        // Calculate the position in the image
        const int pos = i * w + j;
        // Set the value
        image[pos] = value;
    }
}