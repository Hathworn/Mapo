#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Process in a loop to potentially enhance performance for very large arrays
    // by utilizing thread block size more efficiently
    for(; i < n; i += blockDim.x * gridDim.x) {
        a[i] += b[i];
    }
}