#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate unique thread index for global memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform addition for each thread
    c[i] = a[i] + b[i];
}