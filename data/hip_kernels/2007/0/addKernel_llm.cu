#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx.x and blockDim.x to process larger data with grid-stride loop
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    for (; i < size; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}