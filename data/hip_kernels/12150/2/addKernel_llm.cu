#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index for all threads
    if (i < N) // Ensure within bounds for large data
    {
        c[i] = a[i] + b[i];
    }
}