#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_float(int n, float *a, float *b, float *sum)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better global memory access pattern
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] - b[i];
    }
}