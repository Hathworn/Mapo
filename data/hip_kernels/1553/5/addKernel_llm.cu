#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index for better scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    c[i] = a[i] + b[i];
}