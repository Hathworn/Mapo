#include "hip/hip_runtime.h"
#include "includes.h"
#define _size 512

__global__ void mul(int *a, int *b, int *c)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x; // Precompute the index for better readability and efficiency
    c[index] = a[index] * b[index]; // Use precomputed index for operations
}