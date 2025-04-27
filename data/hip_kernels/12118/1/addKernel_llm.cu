#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *a, int *b, int *c)
{
    // Calculate global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use global index to perform operation
    c[i] = a[i] + b[i];
}