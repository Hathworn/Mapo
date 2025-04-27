#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for the loop
    
    // Use stride loop for improved parallel efficiency
    for (; i < n; i += stride)
    {
        sum[i] = a[i] + b[i];
    }
}