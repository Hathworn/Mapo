#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencilReadOnly2(float *src, float *dst, int size, float* stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    idx += 11;
    if (idx >= size)
        return;

    float out = 0;
    // Use shared memory to reduce global memory access
    __shared__ float shSrc[256 + 20]; // example, adjust based on block size

    int localIdx = threadIdx.x + 11;
    // Load shared memory considering boundary checks
    shSrc[localIdx] = src[idx];
    if (threadIdx.x < 10) { // extra loads for halo elements
        shSrc[threadIdx.x] = src[idx - 11];
        shSrc[localIdx + blockDim.x] = src[idx + blockDim.x];
    }
    __syncthreads();

    #pragma unroll
    for (int i = -10; i < 10; i++) {
        out += shSrc[localIdx + i] * stencilWeight[i + 10];
    }

    dst[idx] = out;
}