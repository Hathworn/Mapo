#include "hip/hip_runtime.h"
#include "includes.h"

// Use a more efficient thread indexing strategy
__global__ void add(int *a, int *b, int *c)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // calculate global thread ID
    if (tid < N)
        c[tid] = a[tid] + b[tid]; // perform addition only if within bounds
}