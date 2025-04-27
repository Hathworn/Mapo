#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatrix(int *d1_in, int *d2_in, int *d_out, int n, int m, int k) {
    // Calculate global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (row < n && col < k) {
        int sum = 0;
        for (int i = 0; i < m; i++) {
            sum += d1_in[row * m + i] * d2_in[i * k + col];
        }
        d_out[row * k + col] = sum;
    }
}