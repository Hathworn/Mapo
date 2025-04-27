#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate the global index
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we operate within bounds
    if (pos < len)
    {
        // Perform vector scaling
        d_res[pos] = d_src[pos] * scale;
    }
}