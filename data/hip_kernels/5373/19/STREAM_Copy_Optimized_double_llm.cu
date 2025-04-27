```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_Optimized_double(double *a, double *b, size_t len)
{
    // Calculate the unique thread index for each thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride access pattern for better memory coalescing
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        b[i] = a[i];
    }
}