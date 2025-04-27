#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation for 1D grid.
    if (i < n) // Use < instead of >= to improve readability.
    {
        binary[i] = (x[i] >= 0) ? 1 : -1; // Conditionally assign value based on input.
    }
}