#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void div(float *a, float *b, float *c)
{
    // Optimize by using thread idx for parallelism
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    c[idx] = a[idx] / b[idx];
}