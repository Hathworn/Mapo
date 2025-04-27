#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    // Calculate index using grid-stride loop for better parallel efficiency
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] + b[i];
    }
}