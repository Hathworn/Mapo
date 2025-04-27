#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for vector subtraction
extern "C"
__global__ void sub(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle larger arrays, increasing parallelism
    for (int idx = i; idx < n; idx += gridDim.x * blockDim.x)
    {
        result[idx] = a[idx] - b[idx];
    }
}