#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Kernel
__global__ void vec_mulMany_f (int n, int sizeKernel, float *result, float *x, float *kernel)
{
    // Calculate global thread ID
    int id = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * threadIdx.y + gridDim.x * blockIdx.y);
    
    // Bulk write with boundary check
    if (id < n) 
    {
        result[id] = x[id] * kernel[id % sizeKernel];
    }
}