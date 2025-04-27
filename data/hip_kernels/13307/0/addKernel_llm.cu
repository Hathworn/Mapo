#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx and blockDim to handle larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) // Ensure within bounds
    {
        c[i] = a[i] + b[i];
    }
}