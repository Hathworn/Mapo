#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_Optimized(float *a, float *b, float *c, size_t len)
{
    // Calculate unique thread index for grid and block configuration
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Only perform computation if idx is within array bounds
    if (idx < len)
    {
        c[idx] = a[idx] + b[idx];
    }
}