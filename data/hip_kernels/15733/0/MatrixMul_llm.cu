#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize Matrix Multiplication kernel
__global__ void MatrixMul(int* a, int* b, int* c, int n) {
    // Calculate unique global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int temp_sum = 0;

    // Boundary guard
    if (row < n && col < n) {
        // Loop unrolling for performance improvement
        for (int k = 0; k < n; k += 4) {
            temp_sum += a[row * n + k] * b[k * n + col];
            if (k+1 < n) temp_sum += a[row * n + (k+1)] * b[(k+1) * n + col];
            if (k+2 < n) temp_sum += a[row * n + (k+2)] * b[(k+2) * n + col];
            if (k+3 < n) temp_sum += a[row * n + (k+3)] * b[(k+3) * n + col];
        }
        c[row * n + col] = temp_sum;
    }
}