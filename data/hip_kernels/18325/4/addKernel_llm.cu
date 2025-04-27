#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index for accessing arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread computes one element, assuming array size matches grid size
    c[i] = a[i] + b[i];
}