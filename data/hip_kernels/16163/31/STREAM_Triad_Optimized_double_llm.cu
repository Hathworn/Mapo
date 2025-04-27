#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Calculate global thread ID
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Use stride loop to handle larger data sets efficiently
    size_t stride = blockDim.x * gridDim.x;
    
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}