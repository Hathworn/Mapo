#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Optimize access by using one-dimensional block and thread index calculations.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop over elements to maximize parallelism.
    for (int pos = idx; pos < w * h; pos += stride)
    {
        image[pos] = value;
    }
}