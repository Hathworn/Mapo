#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use grid-stride loop for better scalability
    for (int pos = blockIdx.x * blockDim.x + threadIdx.x; pos < len; pos += blockDim.x * gridDim.x) {
        d_res[pos] = d_src[pos] * scale;
    }
}