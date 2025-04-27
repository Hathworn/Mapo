#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
extern "C"
__global__ void addScalar(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure no unnecessary branching
    if (i < n) 
    {
        result[i] = a[i] + b;
    }
}