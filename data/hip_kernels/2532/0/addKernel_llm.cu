#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out-of-bounds memory
    if (i < blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}