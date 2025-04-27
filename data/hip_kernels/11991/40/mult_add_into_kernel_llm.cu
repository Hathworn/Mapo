#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Optimize index calculation by avoiding repetitive calculations
    int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if(idx < n) {
        c[idx] += a[idx] * b[idx];
    }
}