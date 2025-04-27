#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VectorAdd(int *a, int *b, int *c, int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (i < n) {
        c[i] = a[i] + b[i];
    }
}