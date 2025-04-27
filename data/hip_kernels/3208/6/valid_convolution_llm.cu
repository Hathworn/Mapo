#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void valid_convolution(float *d_kernel, int k_size, float *d_matrix, int size_x, int size_y, float *d_conv, int max_row, int max_col) {
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if thread is within bounds
    if (max_row > row && max_col > col) {
        // Initialize the convolution sum to 0
        float sum = 0.0f;

        // Perform convolution
        for (int k_row = 0; k_row < k_size; k_row++) {
            for (int k_col = 0; k_col < k_size; k_col++) {
                int matrix_idx = (col + k_col) + (row + k_row) * size_x;
                int kernel_idx = k_col + k_row * k_size;
                sum += d_kernel[kernel_idx] * d_matrix[matrix_idx];
            }
        }

        // Write result to global memory
        d_conv[col + row * max_col] = sum;
    }
}