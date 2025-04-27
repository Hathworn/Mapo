#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void cuPow(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure every thread calculates within bounds
    if (i < n)
    {
        result[i] = powf(a[i], b); // Use powf for single precision
    }
}