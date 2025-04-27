#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void div_float(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use a conditional operator to avoid division by zero
        sum[i] = b[i] != 0.0f ? a[i] / b[i] : 0.0f;
    }
}