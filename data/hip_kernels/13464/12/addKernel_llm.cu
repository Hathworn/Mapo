#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < blockDim.x) // Ensure within bounds
    {
        c[i] = a[i] + b[i]; // Perform addition
    }
}