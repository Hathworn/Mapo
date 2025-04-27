#include "hip/hip_runtime.h"
#include "includes.h"

// Inline function to retrieve imaginary part of a float2
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

// Optimized kernel function
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < h && j < w) {
        // Calculate position in image array
        const int pos = i * w + j;
        // Assign value to the image
        image[pos] = value;
    }
}