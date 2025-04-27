#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Triad(float *a, float *b, float *c, float scalar, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}