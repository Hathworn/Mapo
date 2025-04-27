#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index bounds before performing addition
    if (i < n) {
        c[i] = a[i] + b[i];
    }
}