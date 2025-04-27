#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_double(double *a, double *b, double *c, size_t len)
{
    // Calculate global thread ID
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x; // Precompute stride

    // Loop unrolling for efficient memory access
    for (; idx + stride < len; idx += stride * 2) {
        c[idx] = a[idx] + b[idx];
        c[idx + stride] = a[idx + stride] + b[idx + stride];
    }

    // Handle remaining elements
    if (idx < len) {
        c[idx] = a[idx] + b[idx];
    }
}