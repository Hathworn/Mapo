#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_Optimized_double(double *a, double *b, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure thread operates within bounds
    if (idx < len) {
        b[idx] = a[idx];
    }
}