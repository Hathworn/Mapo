#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_example(int *c, const int *a, const int *b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform operation if within bounds
    if (i < gridDim.x * blockDim.x) {
        c[i] = a[i] + b[i];
    }
}