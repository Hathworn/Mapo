#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale(float *a, float *b, float scale, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize by using a strided loop and unrolling
    for (; idx < len; idx += blockDim.x * gridDim.x)
    {
        #pragma unroll
        b[idx] = scale * a[idx];
    }
}