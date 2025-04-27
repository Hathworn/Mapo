#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_Optimized(float *a, float *b, size_t len)
{
    // Calculate the global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Check and assign elements within bounds
    if (idx < len) {
        b[idx] = a[idx];
    }
}