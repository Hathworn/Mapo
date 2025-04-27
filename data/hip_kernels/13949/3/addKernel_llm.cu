#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx.x and blockDim.x for multi-block parallel processing
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds
    if (i < BLOCK_SIZE) {
        c[i] = a[i] + b[i];
    }
}