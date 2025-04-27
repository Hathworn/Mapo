#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Add_Optimized(float *a, float *b, float *c, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Use more efficient branching to ensure valid index within bounds
    if (idx < len) 
    {
        // Perform vector addition for valid indices
        c[idx] = a[idx] + b[idx];
    }
}