#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out of bounds
    if (i < n)
    {
        // Perform the multiplication and addition
        c[i] += a[i] * b[i];
    }
}