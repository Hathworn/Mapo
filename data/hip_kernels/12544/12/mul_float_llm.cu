#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

// Optimized kernel function for float multiplication
__global__ void mul_float(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Using registers for better performance
        float ai = a[i];
        float bi = b[i];
        sum[i] = ai * bi;
    }
}