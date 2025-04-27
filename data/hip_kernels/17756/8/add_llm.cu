#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float* vec_a, float* vec_b, float* vec_c, int n)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle large arrays efficiently
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride)
    {
        vec_c[i] = vec_a[i] + vec_b[i];
    }
}