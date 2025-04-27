#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{
}

__global__ void addKernel(int* c, const int* a, const int* b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition if within bounds (Assumes array size >= gridDim.x * blockDim.x)
    c[i] = a[i] + b[i];
}