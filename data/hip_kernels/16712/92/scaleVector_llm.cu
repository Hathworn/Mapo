#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    const int stride = blockDim.x * gridDim.x;
    for (int pos = blockIdx.x * blockDim.x + threadIdx.x; pos < len; pos += stride) {
        // Compute result using multiple threads
        d_res[pos] = d_src[pos] * scale;
    }
}