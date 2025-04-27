#include "hip/hip_runtime.h"
#include "includes.h"


hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);


__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional to ensure that only valid indices are processed
    if (i < gridDim.x * blockDim.x) {
        c[i] = a[i] + b[i];
    }
}