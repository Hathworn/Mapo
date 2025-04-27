#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil(float *src, float *dst, int size, float *stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    idx += 11;

    // Load data into shared memory to reduce global memory accesses
    __shared__ float sharedSrc[1024 + 20]; // Adjust size based on blockDim.x
    int sharedIdx = threadIdx.x + 10;
    
    if (idx < size) {
        sharedSrc[sharedIdx] = src[idx];
        if (threadIdx.x < 10) {
            // Load halo elements
            sharedSrc[threadIdx.x] = src[idx - 11];
            sharedSrc[sharedIdx + blockDim.x] = src[idx + blockDim.x];
        }
    }
    __syncthreads();

    if (idx >= size)
        return;

    // Use shared array to accumulate the results
    float out = 0;
    #pragma unroll
    for(int i = -10; i < 10; i++)
    {
        out += sharedSrc[sharedIdx + i] * stencilWeight[i + 10];
    }
    dst[idx] = out;
}