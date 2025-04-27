#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure index bounds checking is done before calculations 
    if (i < h && j < w)
    {
        const int pos = i * w + j;

        // Use a direct assignment to the memory
        image[pos] = value;
    }
}