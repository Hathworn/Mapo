#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    // Each thread computes one element
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    c[index] = a[index] + b[index];
}