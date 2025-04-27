#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void sumArraysOnGPU(float *A, float *B, float *C, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < n) // Ensure thread does not access out-of-bounds memory
    {
        C[i] = A[i] + B[i]; // Perform the sum
    }
}
```
