#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Calculate the global index for this thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition for this specific index
    c[idx] = a[idx] + b[idx];
}