#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we don't access out of bounds
    if (tid < n) 
    {
        c[tid] = a[tid] + b[tid];
    }
}