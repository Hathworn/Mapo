#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_Optimized(float *a, float *b, float scale, size_t len)
{
    // Calculate the unique thread index within the grid
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride to enable processing of remaining elements
    size_t stride = blockDim.x * gridDim.x;

    // Loop to process beyond the initial assignment if len is larger
    for (size_t i = idx; i < len; i += stride)
    {
        b[i] = scale * a[i];
    }
}