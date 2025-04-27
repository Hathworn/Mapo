#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate the global thread index
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional operator for a more concise boundary check
    if (pos < len) d_res[pos] = d_src[pos] * scale;
}