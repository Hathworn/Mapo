#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    
    // Loop with grid stride to handle large data sets efficiently
    for(; i < n; i += gridStride) {
        c[i] += a[i] * b[i];
    }
}