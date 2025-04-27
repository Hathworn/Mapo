#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate position and check bounds
    for (int pos = blockIdx.x * blockDim.x + threadIdx.x; pos < len; pos += gridDim.x * blockDim.x)
    {
        // Scale the vector
        d_res[pos] = d_src[pos] * scale;
    }
}