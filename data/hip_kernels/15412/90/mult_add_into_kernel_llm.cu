#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate a unique thread index for 2D grid with 1D block
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (i < n) {
        // Perform the multiplication and addition
        c[i] += a[i] * b[i];
    }
}