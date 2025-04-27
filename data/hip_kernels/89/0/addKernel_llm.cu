#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use global index for computation
    c[i] = a[i] + b[i];
}