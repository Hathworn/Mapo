#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int gridSize = blockDim.x * gridDim.x;          // Calculate the stride for grid
    while (i < n) {                                 // Loop to cover all elements
        c[i] += a[i] * b[i];
        i += gridSize;                              // Increment by grid size
    }
}