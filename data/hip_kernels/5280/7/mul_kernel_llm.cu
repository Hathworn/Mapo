#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(const int n, const float *a, const float *b, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use loop unrolling to optimize memory access
    for (; i + 3 < n; i += stride * 4) {
        y[i] = a[i] * b[i];
        y[i + 1] = a[i + 1] * b[i + 1];
        y[i + 2] = a[i + 2] * b[i + 2];
        y[i + 3] = a[i + 3] * b[i + 3];
    }
    
    // Process remaining elements
    for (; i < n; i += stride) {
        y[i] = a[i] * b[i];
    }
}