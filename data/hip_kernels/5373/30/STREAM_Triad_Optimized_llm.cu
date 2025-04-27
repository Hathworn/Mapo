#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Triad_Optimized(float *a, float *b, float *c, float scalar, size_t len)
{
    // Use stride loop to cover the entire data size
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;
    for (size_t i = idx; i < len; i += stride) {
        c[i] = a[i] + scalar * b[i];
    }
}