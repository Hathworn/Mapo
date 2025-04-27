#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Using 'if' to check for valid index to prevent out-of-bounds access
    if (idx < 500) {
        c[idx] = a[idx] + b[idx];
    }
}