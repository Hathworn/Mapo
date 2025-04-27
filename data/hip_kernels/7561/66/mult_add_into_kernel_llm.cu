#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global index once
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient bound check and processing in loop
    for (; i < n; i += blockDim.x * gridDim.x) {
        c[i] += a[i] * b[i];
    }
}