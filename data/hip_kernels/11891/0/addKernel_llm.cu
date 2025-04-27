#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockDim.x for grid-stride loop to process larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < size; i += stride) {
        c[i] = a[i] + b[i];
    }
}