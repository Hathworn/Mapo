#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate unique global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if within bounds
    if (i < size) {
        c[i] = a[i] + b[i];
    }
}