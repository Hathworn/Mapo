#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use a strided loop for better memory coalescing and handling larger data sizes
    for (int pos = blockIdx.x * blockDim.x + threadIdx.x; pos < len; pos += blockDim.x * gridDim.x) {
        d_res[pos] = d_src[pos] * scale;
    }
}