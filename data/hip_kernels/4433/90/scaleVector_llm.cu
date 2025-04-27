#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Calculate linear thread index
    int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better occupancy
    while (pos < len) {
        d_res[pos] = d_src[pos] * scale;
        pos += blockDim.x * gridDim.x;
    }
}