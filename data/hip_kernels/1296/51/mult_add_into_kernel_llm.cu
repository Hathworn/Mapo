#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index using 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop through data in steps of total threads in grid
    for (; i < n; i += blockDim.x * gridDim.x) {
        c[i] += a[i] * b[i];
    }
}