#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for memory coalescing
__global__ void vec_copysignf(size_t n, float *result, float *x, float *y) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Use for loop to ensure memory access within bounds for additional threads
    for (int i = id; i < n; i += blockDim.x * gridDim.x) {
        result[i] = copysignf(x[i], y[i]);
    }
}