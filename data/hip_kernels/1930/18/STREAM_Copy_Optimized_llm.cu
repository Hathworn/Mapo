```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Copy_Optimized(float *a, float *b, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop over the elements with stride of total threads
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x)
    {
        b[i] = a[i];
    }
}