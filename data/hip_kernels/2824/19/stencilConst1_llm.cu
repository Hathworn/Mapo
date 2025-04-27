#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilConst1(float *src, float *dst, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 11;  // Combine offset calculation into one step
    if (idx < size)  // Reverse the logic for branch optimization
    {
        float out = 0;
        #pragma unroll
        for (int i = -10; i < 10; i++)
        {
            out += src[idx + i] * const_stencilWeight[i + 10];  // Load and compute simultaneously
        }
        dst[idx] = out;  // Assign the computed value
    }
}