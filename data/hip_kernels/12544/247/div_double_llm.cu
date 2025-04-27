#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void div_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n && b[i] != 0) // Check divisor non-zero
    {
        sum[i] = a[i] / b[i];
    }
}