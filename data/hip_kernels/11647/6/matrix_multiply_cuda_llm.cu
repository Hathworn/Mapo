#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiply_cuda(int* d_a, int* d_b, int* d_c, int m, int n) {

    // Get row and column indices
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Row i of matrix C
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Column j of matrix C

    // Check bounds to avoid out-of-bounds access
    if (i < m && j < m) {
        int cell = 0;
        for (int k = 0; k < n; k++) {
            cell += d_a[i * n + k] * d_b[k * m + j]; // Accumulate product of row and column
        }
        d_c[i * m + j] = cell; // Store result in matrix C
    }
}