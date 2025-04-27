#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10

__global__ void add(int *a, int *b, int *c)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (tid < N)
    {
        c[tid] = a[tid] + b[tid];
    }
}