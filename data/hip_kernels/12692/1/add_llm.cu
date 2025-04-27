#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // calculate global thread ID
    if (tid < N)
    {
        c[tid] = a[tid] + b[tid];
    }
}