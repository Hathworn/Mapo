#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Vector_Addition(int *dev_a, int *dev_b, int *dev_c)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread ID is within bounds and perform addition
    if (tid < N)
        dev_c[tid] = dev_a[tid] + dev_b[tid];
}