#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Calculate global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure work only if idx is within bounds
    if (idx < len) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}