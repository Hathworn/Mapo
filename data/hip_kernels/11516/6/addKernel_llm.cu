#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int * dev_a, int* x)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x; // Support all threads in all blocks
    if (i < *x) // Ensure index is within range
    {
        dev_a[i] = (dev_a[i] < *x) ? 0 : 1; // Use ternary operator for branch optimization
    }
}