#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_double(int n, double *a, double *b, double *sum)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if statement without braces for single line
    if (i < n) sum[i] = a[i] - b[i];
}