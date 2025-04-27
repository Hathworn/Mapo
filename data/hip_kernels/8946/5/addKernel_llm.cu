#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockDim.x to ensure we handle all threads in a grid/block
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Ensure we do not exceed the size of the array
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}