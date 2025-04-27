#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Handle the data at this index
    if (tid < N) // Ensure within bounds before loop
    {
        c[tid] = a[tid] + b[tid];
    }
    tid += blockDim.x * gridDim.x;
    while (tid < N)
    {
        c[tid] = a[tid] + b[tid];
        tid += blockDim.x * gridDim.x;
    }
}