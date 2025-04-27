#include "hip/hip_runtime.h"
#include "includes.h"

// Use blockIdx and blockDim for scalable parallelism
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure memory access is within bounds (assuming n is size of arrays)
    if (i < n) {
        c[i] = a[i] + b[i];
    }
}