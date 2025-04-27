#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Optimized kernel to utilize block and grid dimensions
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure threads don't access out-of-bound memory
    if (i < size)
    {
        c[i] = a[i] + b[i];
    }
}