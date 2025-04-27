#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add(float *a, float *b, float *c, size_t len)
{
    // Calculate global index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop for processing
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}