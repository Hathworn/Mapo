#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use grid and block dimensions to calculate global thread ID
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Launch threads only for valid positions
    if (pos < len) {
        d_res[pos] = d_src[pos] * scale;
    }
}