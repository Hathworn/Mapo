#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_mult_kernel(int *mat_a, int *mat_b, int *result, int a_rows, int a_cols, int b_cols) {
    // Compute row and column for the current thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < a_rows && col < b_cols) {
        int temp_res = 0;
        for (int k = 0; k < a_cols; k++) {
            temp_res += mat_a[row * a_cols + k] * mat_b[k * b_cols + col];
        }
        result[row * b_cols + col] = temp_res;
    }
}