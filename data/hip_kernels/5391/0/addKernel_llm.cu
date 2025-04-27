#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform element-wise addition if within bounds
    if (i < blockDim.x) {
        c[i] = a[i] + b[i];
    }
}