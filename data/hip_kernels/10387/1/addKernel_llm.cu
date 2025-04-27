#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate unique global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Perform addition only if within bounds
    if (i < blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}