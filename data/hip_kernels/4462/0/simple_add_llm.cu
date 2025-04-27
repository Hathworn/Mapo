#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for better performance
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        a[i] = a[i] + b[i];
    }
}