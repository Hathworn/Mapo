#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling: process 4 elements per thread when possible
    int stride = gridDim.x * blockDim.x; // Total number of threads in grid
    for (; i < n; i += stride)
    {
        c[i] += a[i] * b[i];
    }
}