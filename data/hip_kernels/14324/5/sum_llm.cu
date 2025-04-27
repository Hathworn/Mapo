#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *a, int *b, int *c)
{
    // Optimize by using threadIdx.x to process elements in parallel
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}