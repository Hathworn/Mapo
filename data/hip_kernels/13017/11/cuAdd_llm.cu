#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuAdd(int *a, int *b, int *c, int N)
{
    // Get 1D global index
    int offset = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread is within bounds
    if (offset < N)
    {
        // Directly perform addition
        c[offset] = a[offset] + b[offset];
    }
}