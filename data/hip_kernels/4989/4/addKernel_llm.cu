#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < N) // Ensure within bounds
    {
        c[i] = a[i] + b[i]; // Perform addition
    }
}