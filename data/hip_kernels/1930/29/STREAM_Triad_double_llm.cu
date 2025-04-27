#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Optimize indexing by calculating once outside the loop
    size_t stride = blockDim.x * gridDim.x;
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use grid-stride loop for better performance
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}