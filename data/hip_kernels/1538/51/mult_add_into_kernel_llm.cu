#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using threadIdx.y to process multiple elements per thread
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Compute stride for grid-stride loop

    for (int i = idx; i < n; i += stride) { // Use grid-stride loop to handle more elements
        c[i] += a[i] * b[i];
    }
}