#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}