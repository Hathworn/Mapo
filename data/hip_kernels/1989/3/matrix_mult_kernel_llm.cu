#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_mult_kernel(int *a, int *b, int *c, int m, int n, int k) {
    // Compute row and col indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize sum outside the loop
    int sum = 0;

    // Ensure the indices are within matrix bounds
    if (col < n && row < m) {
        // Calculate the dot product
        for (int i = 0; i < k; i++) {
            sum += a[row * k + i] * b[i * n + col];
        }
        // Write the result to the matrix
        c[row * n + col] = sum;
    }
}