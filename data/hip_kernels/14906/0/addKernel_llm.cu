#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Compute global index for each thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Memory bounds checking for safety
    if (i < blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}