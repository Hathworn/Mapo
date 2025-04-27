#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilReadOnly1(float *src, float *dst, int size, float* stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 11;
    if (idx >= size) return;

    // Use shared memory to reduce global memory access latency
    __shared__ float sharedStencilWeight[20];
    if (threadIdx.x < 20) {
        sharedStencilWeight[threadIdx.x] = stencilWeight[threadIdx.x];
    }
    __syncthreads();

    float out = 0;
    #pragma unroll
    for(int i = -10; i < 10; i++)
    {
        out += src[idx + i] * sharedStencilWeight[i + 10];
    }
    dst[idx] = out;
}