#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate global thread index
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Using grid-stride loop to handle large vectors
    for (int idx = pos; idx < len; idx += blockDim.x * gridDim.x)
    {
        d_res[idx] = d_src[idx] * scale;
    }
}