#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using block and thread indexing
__global__ void add(int *a, int *b, int *c)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique index for each thread
    c[idx] = a[idx] + b[idx]; // Perform addition at each index
}