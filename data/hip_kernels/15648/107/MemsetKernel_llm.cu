#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread ID
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Check bounds and update image
    if (j < w && i < h) {
        int pos = i * w + j;
        image[pos] = value;
    }
}