#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index based on block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index does not exceed allocated memory
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}