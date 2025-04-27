#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    // Cache blockDim.x for potential optimization
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better parallelization
    for (int i = idx; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] + b[i];
    }
}