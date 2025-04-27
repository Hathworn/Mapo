#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void addProduct(int n, float *a, float *b, float *c, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use registers for intermediate computation to reduce memory access
        float bi = b[i];
        float ci = c[i];
        result[i] = a[i] + bi * ci;
    }
}