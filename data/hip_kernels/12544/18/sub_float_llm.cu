#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sub_float(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop to process more elements per thread to improve memory throughput
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] - b[i];
    }
}