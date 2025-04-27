#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use threadIdx.x for parallelism within a block
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    c[i] = a[i] + b[i];
}