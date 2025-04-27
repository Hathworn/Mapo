#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Using a loop to handle out-of-bounds checking and reducing the number of kernel launches when len is large
    for (int i = pos; i < len; i += blockDim.x * gridDim.x) {
        d_res[i] = d_src[i] * scale;
    }
}