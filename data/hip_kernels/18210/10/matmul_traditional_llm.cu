#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_traditional(const float *a, const float *b, float *c, int n, int m) {
    // Calculate the global row and column index
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    // Proceed only if within bounds
    if(row < n && col < m) {
        float sum = 0.0f;
        // Use a single loop for clearer indexing
        for(int k = 0; k < n; ++k) {
            sum += a[row * n + k] * b[k * m + col];
        }
        c[row * m + col] = sum;
    }
}