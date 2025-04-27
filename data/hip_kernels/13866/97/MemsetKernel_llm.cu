#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early for threads outside image bounds
    if (i < h && j < w)
    {
        // Calculate the linear index for the pixel
        const int pos = i * w + j;

        // Set the image value
        image[pos] = value;
    }
}
```
