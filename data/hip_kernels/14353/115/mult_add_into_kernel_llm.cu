#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flatten 1D block
    int stride = blockDim.x * gridDim.x;           // Calculate stride

    // Loop to process multiple elements per thread, improving memory coalescing
    for (; i < n; i += stride) {
        c[i] += a[i] * b[i];
    }
}