#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VectorAdd(int *a, int *b, int *c, int n)
{
    // Calculate once to reduce redundant calculations
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and perform addition
    if (globalThreadId < n)
        c[globalThreadId] = a[globalThreadId] + b[globalThreadId];
}