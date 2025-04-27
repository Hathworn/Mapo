#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized HIP kernel for vector addition

__global__ void vecAdd(float *a, float *b, float *c, int n)
{
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread to improve memory access patterns
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride) {
        c[i] = a[i] + b[i];
    }
}