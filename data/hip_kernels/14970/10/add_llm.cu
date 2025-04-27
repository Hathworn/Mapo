#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Use thread index for parallel addition
    int idx = threadIdx.x;
    c[idx] = a[idx] + b[idx];
}