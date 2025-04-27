#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using threadIdx and blockIdx for parallel execution
__global__ void sub(float *a, float *b, float *c)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure idx does not exceed array bounds
    if (idx < 1) {
        c[idx] = a[idx] - b[idx];
    }
}