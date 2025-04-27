```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize memory access
__global__ void addKernel(int * dev_a, int * dev_b, int * dev_c)
{
    int i = threadIdx.x;
    // Check if the thread index is within bounds
    if (i < blockDim.x)
    {
        dev_c[i] = dev_a[i] + dev_b[i];
    }
}