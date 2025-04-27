```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize loop to process multiple elements per thread
    for (; i < n; i += stride) {
        c[i] += a[i] * b[i];
    }
}