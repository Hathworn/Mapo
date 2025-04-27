#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized HIP kernel to add elements of two arrays
__global__ void init(int n, float *x, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) { // Ensure work is not done beyond necessary
        x[i] = 1.0f;
        y[i] = 2.0f;
    }
}