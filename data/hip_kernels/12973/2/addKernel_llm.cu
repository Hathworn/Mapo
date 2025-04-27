#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (i < N) // Boundary check to avoid accessing out-of-bound memory
    {
        c[i] = a[i] + b[i];
    }
}