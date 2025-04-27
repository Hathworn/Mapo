```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multKernel(int *c, const int *a, const int *b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform multiplication only if within array bounds
    if (i < N) {
        c[i] = a[i] * b[i];
    }
}