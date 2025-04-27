#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate unique thread index within grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to allow one thread to process multiple elements
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        c[i] += a[i] * b[i];
    }
}