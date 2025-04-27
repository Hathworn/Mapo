#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int n, float *a, float *b, float *sum)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to handle larger arrays
    for (int index = i; index < n; index += blockDim.x * gridDim.x) 
    {
        sum[index] = a[index] + b[index];
    }
}