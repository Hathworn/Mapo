#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void stencilReadOnly3(float * __restrict__ src, float * __restrict__ dst, int size, const float* __restrict__ stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 11;
    if (idx >= size + 11) return; // Adjust condition to account for initial index offset

    float out = 0;
    #pragma unroll
    for(int i = -10; i < 10; i++)
    {
        out += __ldg(&src[idx+i]) * __ldg(&stencilWeight[i+10]); // Use __ldg for read-only memory access
    }
    dst[idx] = out;
}