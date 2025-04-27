#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void Vector_Addition(int *a, int *b, int *c, int n)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID
    if (tid < n)                                      // Ensure within bounds of array
    {
        c[tid] = a[tid] + b[tid];                     // Perform vector addition
    }
}