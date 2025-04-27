#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *a, int *b, int *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (i < n) // Check to prevent out-of-bounds access
    {
        c[i] = a[i] + b[i];
    }
}