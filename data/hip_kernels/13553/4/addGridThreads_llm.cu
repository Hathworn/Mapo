#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addGridThreads(int n, float *x, float *y)
{
    // Cache frequently used values to registers
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = index; i < n; i += stride)
    {
        // Optimize memory access pattern by coalescing
        y[i] = x[i] + y[i];
    }
}