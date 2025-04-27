#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index doesn't exceed array size
    if (i < blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}