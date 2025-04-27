#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_double(double *a, double *b, double *c, size_t len)
{
    // Use a single loop iteration to reduce overhead.
    // Check if index is within bounds before computation.
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < len) {
        c[idx] = a[idx] + b[idx];
    }
}