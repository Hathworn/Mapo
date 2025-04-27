#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel using block and grid dimensions for larger arrays
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index based on thread and block index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform addition if within bounds
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}