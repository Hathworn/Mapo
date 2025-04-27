#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, int *a, int *b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform addition if index is within bounds (assumes N is the size of the arrays)
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}