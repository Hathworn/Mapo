#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c, int N)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that each thread operates within the valid data range
    if (tid < N)
    {
        c[tid] = a[tid] + b[tid];
    }
}