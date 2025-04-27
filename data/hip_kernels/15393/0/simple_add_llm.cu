#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    // Get global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to allow multiple active warps if data size is large
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride) {
        a[i] = a[i] + b[i];
    }
}