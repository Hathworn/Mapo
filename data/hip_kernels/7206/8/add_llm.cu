#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Use blockIdx and blockDim to calculate unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use thread index to access different elements in array
    c[index] = a[index] + b[index];
}