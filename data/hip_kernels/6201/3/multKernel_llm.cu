#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx and blockDim for better scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid magic numbers, use a constant instead
    const int multiplier = 100;
    c[i] = a[i] * b[i] * multiplier;
}