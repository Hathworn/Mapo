#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized(float *a, float *b, float *c, float scalar, size_t len)
{
    // Use all available threads by removing the size check
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < len) 
    {
        // Perform computation for each valid index
        c[idx] = a[idx] + scalar * b[idx];
    }
}