#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Copy_Optimized_double(double *a, double *b, size_t len)
{
    // Calculate global thread index once
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use grid-stride loop for better occupancy and performance
    for (; idx < len; idx += blockDim.x * gridDim.x)
    {
        b[idx] = a[idx];
    }
}