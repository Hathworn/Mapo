#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilShared1(float *src, float *dst, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float buffer[1024+21];
    
    // Load data into shared memory with coalesced access
    for (int i = threadIdx.x; i < 1024 + 21; i += blockDim.x)
    {
        int bufferIndex = blockIdx.x * blockDim.x + i;
        if (bufferIndex < size)
        {
            buffer[i] = src[bufferIndex];
        }
    }

    __syncthreads();
    
    // Early exit if out of bounds
    idx += 10; // Adjust initial index for stencil calculation

    if (idx >= size)
        return;

    float out = 0;
    #pragma unroll
    for (int i = -10; i < 10; i++)
    {
        out += buffer[threadIdx.x + 10 + i] * const_stencilWeight[i + 10];
    }
    
    dst[idx] = out;
}