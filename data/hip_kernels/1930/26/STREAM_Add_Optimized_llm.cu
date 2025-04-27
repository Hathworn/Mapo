#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_Optimized(float *a, float *b, float *c, size_t len)
{
    // Calculate unique global index for each thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a stride loop to ensure all elements are processed by threads
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}