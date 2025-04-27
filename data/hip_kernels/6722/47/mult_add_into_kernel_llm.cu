```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Optimize index calculation for readability and performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize memory access pattern by using cooperative work size
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        c[idx] += a[idx] * b[idx];
    }
}