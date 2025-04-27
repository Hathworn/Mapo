#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global thread index to handle arrays larger than block size
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) { // Ensure we don't access out of bounds
        c[i] = a[i] + b[i];
    }
}