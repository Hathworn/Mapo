```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x; // Compute global index
    c[index] = a[index] + b[index]; // Perform addition based on global index
}