#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index for 1D flattened array
    int idx = blockIdx.y * blockDim.y * w + blockIdx.x * blockDim.x + threadIdx.y * w + threadIdx.x;

    // Grid stride loop for handling images larger than grid
    const int stride = blockDim.x * gridDim.x; 
    for (int pos = idx; pos < w * h; pos += stride) {
        image[pos] = value; 
    }
}