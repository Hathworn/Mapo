#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    if (i < n) {
        c[i] += a[i] * b[i];  // Perform operation if within bounds
    }
}