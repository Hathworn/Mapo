#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function to set specific elements to zero
__global__ void set_zero(double *A, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds and simplify conditional logic
    if (x < n && y == i && x != i) {
        A[x * n + y] = 0;
    }
}