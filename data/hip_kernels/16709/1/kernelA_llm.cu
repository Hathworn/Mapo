#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Use blockIdx.x and blockDim.x for optimized access patterns.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx is within array bounds.
    if (idx < size) {
        r[idx] = x[idx] * y[idx] + z[idx];
    }
}