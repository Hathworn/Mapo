#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized(float *a, float *b, float *c, float scalar, size_t len)
{
    // Use grid stride loop for optimal out-of-bound checks
    for (size_t idx = threadIdx.x + blockIdx.x * blockDim.x; idx < len; idx += blockDim.x * gridDim.x) 
    {
        c[idx] = a[idx] + scalar * b[idx];
    }
}