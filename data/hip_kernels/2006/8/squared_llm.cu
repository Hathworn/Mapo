#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for squaring elements
extern "C"
__global__ void squared(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for optimization
    for (; i < n; i += stride) { // Loop with stride to improve data access pattern
        result[i] = a[i] * a[i];
    }
}