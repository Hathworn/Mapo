#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale(float *a, float *b, float scale, size_t len)
{
    // Calculate global index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize loop using a grid-stride loop
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = scale * a[idx];
    }
}