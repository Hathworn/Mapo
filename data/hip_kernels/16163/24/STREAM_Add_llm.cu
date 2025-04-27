#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add(float *a, float *b, float *c, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Perform the addition only if index is within bounds
    if (idx < len) {
        c[idx] = a[idx] + b[idx];
    }
}