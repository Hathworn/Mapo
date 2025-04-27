#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate the global thread ID
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize branch by using a single condition check
    if (pos < len) 
    {
        d_res[pos] = d_src[pos] * scale;
    }
}