#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Use stride for loop unrolling
    for (; i < N; i += stride) { // Process multiple elements per thread
        c[i] = a[i] + b[i];
    }
}