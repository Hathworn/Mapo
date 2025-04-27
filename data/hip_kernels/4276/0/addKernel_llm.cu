#include "hip/hip_runtime.h"
#include "includes.h"

#define _SIZE_ 1000000

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index to support larger arrays and avoid bank conflicts
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < _SIZE_) { // Ensure index is within bounds
        c[i] = a[i] + b[i];
    }
}