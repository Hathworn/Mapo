#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilShared2(float *src, float *dst, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float buffer[1024 + 21];
    
    // Load data into shared memory more efficiently
    for (int i = threadIdx.x; i < 1024 + 21; i += blockDim.x)
    {
        int global_idx = idx + i - threadIdx.x;
        if (global_idx < size)  // Boundary check
        {
            buffer[i] = src[global_idx];
        }
        else
        {
            buffer[i] = 0.0f;  // Handle out-of-bound condition
        }
    }

    __syncthreads();

    idx += 11;
    if (idx >= size)
        return;

    float out = 0.0f;
    #pragma unroll
    for (int i = -10; i < 10; i++)
    {
        out += buffer[threadIdx.x + 10 + i] * const_stencilWeight[i + 10];
    }
    dst[idx] = out;
}