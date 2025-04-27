```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_double(double *a, double *b, size_t len)
{
    // Use the loop unrolling technique to minimize loop overhead
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < len)
    {
        b[idx] = a[idx];
    }
    idx += blockDim.x * gridDim.x;
    if (idx < len)
    {
        b[idx] = a[idx];
    }
    idx += blockDim.x * gridDim.x;
    if (idx < len)
    {
        b[idx] = a[idx];
    }
    idx += blockDim.x * gridDim.x;
    if (idx < len)
    {
        b[idx] = a[idx];
    }
    // Process remaining elements if any
    idx += blockDim.x * gridDim.x;
    while (idx < len)
    {
        b[idx] = a[idx];
        idx += blockDim.x * gridDim.x;
    }
}