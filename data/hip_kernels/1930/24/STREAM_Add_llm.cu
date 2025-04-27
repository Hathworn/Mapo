#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add(float *a, float *b, float *c, size_t len)
{
    // Calculate global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Efficient loop limiting with stride
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}