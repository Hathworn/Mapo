```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void window2dKernel(float* __restrict__ idata, const float* __restrict__ window, int width, int height)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    int tidy = threadIdx.y + blockIdx.y * blockDim.y;
    if (tidx < width && tidy < height)
    {
        int index = tidy * width + tidx; // Compute index once and reuse
        idata[index] = window[index] * idata[index];
    }
}