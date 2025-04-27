#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Utilize row-major memory coalescing
    if (i < h && j < w)
    {
        image[i * w + j] = value;
    }
}