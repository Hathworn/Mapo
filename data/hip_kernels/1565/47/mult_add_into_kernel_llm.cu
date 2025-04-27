#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global index, optimize for grid-stride loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop to cover all elements
    for (; i < n; i += stride) {
        c[i] += a[i] * b[i];
    }
}