#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized with grid-stride loop
__global__ void VectorAdd(int *a, int *b, int *c, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Using grid-stride loop for better scalability
    for (; i < n; i += stride) {
        c[i] = a[i] + b[i];
    }
}