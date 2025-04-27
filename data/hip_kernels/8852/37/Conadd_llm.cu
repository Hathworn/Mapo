#include "hip/hip_runtime.h"
#include "includes.h"

// Improved version of Conadd kernel
__global__ void Conadd(float* a, float* b, float* c, int n) {
    // Compute the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Check bounds and perform the addition
    if (idx < n) {
        c[idx] = a[idx] + b[idx];
    }
}