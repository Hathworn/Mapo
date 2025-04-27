#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use block and grid index for processing larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // No bounds checking assuming the caller ensures adequate grid/block sizes
    c[i] = a[i] + b[i];
}