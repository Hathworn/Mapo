#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10

__global__ void sum(int *a, int *b, int *c)
{
    // Calculate global thread index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) // Ensure index is within bounds
    {
        c[i] = a[i] + b[i];
    }
}