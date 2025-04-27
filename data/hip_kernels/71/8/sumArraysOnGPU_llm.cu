#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, int n) {
    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure not accessing out of bound elements
    if (idx < n) {
        C[idx] = A[idx] + B[idx];
    }
}
```
