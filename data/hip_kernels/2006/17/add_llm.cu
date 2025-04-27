#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to perform element-wise addition of two vectors a and b, storing the result in result vector
extern "C"
__global__ void add(int n, float *a, float *b, float *result)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional branch elimination technique
    if (i < n)
    {
        // Perform addition if within bounds
        result[i] = a[i] + b[i];
    }
}