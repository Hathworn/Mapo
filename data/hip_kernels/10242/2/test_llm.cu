```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float *a, float *b, float *c, int N)
{
    // Calculate unique global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread operates within array bounds
    if(idx < N)
    {
        c[idx] = a[idx] * b[idx];
    }
    return;
}