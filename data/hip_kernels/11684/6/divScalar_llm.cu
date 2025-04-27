#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and control divergence in the kernel function
extern "C"
__global__ void divScalar(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use registers for temporary storage
        float ai = a[i];
        // Perform the division
        result[i] = ai / b;
    }
}