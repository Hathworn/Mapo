#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    c[index] = a[index] + b[index];
}