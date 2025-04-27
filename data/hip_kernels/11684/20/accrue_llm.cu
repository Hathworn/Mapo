#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void accrue(int n, float *a, float *b, float p, float *result)
{
    // Compute unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds
    if (i < n)
    {
        result[i] = a[i] * (1.0f + b[i] * p);
    }
}