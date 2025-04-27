#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index and ensure within bounds
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size)
    {
        c[i] = a[i] + b[i];
    }
}