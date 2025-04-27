#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_matrix_mul_optimized(int *a, int *b, int *c, int n_row, int n_col, int n_comm)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Obtain row index using 2D grid
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Obtain col index using 2D grid

    if (row < n_row && col < n_col) { // Ensure indices are within matrix bounds
        int sum = 0;
        for (int j = 0; j < n_comm; ++j) {
            sum += a[row * n_comm + j] * b[j * n_col + col]; // Perform dot product for matrix multiplication
        }
        c[row * n_col + col] = sum; // Store result in output matrix
    }
}