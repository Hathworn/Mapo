#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

const int arraySize = 10000000;

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Optimize to handle full range of indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < arraySize) {
        c[i] = a[i] + b[i];
    }
}