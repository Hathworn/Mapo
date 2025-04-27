#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using 1D grid and block
__global__ void _bcnn_vadd_kernel(int n, float *a, float *b, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        y[i] = a[i] + b[i];
    }
}