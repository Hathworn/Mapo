#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize for potential performance improvements with larger workloads
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Map to unique thread index across blocks
    c[i] = a[i] + b[i];
}