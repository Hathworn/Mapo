#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within array bounds (assuming max array size is known)
    if (i < SIZE) {
        c[i] = a[i] + b[i];
    }
}