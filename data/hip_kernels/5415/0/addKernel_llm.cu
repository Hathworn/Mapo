#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Optimized kernel with grid-stride loop
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop
    for (; i < size; i += stride) {
        c[i] = a[i] + b[i];
    }
}