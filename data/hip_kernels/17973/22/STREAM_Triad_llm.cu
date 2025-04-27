#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Triad(float *a, float *b, float *c, float scalar, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;
    
    for (; idx < len; idx += stride) {
        // Compute c[idx] using fused multiply-add (FMA) for potential performance boost
        c[idx] = fmaf(scalar, b[idx], a[idx]);
    }
}