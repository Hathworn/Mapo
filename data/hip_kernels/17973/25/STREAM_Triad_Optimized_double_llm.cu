#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop over the indices from this starting point
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}