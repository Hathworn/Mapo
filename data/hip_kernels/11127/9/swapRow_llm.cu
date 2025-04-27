#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int greatest_row;  

__device__ void swap(float* arr, int ind_a, int ind_b) {
    float tmp = arr[ind_a];
    arr[ind_a] = arr[ind_b];
    arr[ind_b] = tmp;
}

__global__ void swapRow(float* mat, float* b, float* column_k, int rows, int cols, int k) {
    int row_i = greatest_row;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if swap is necessary and within bounds
    if (k != row_i && i <= cols) {
        if (i < cols) {
            // Swap matrix rows
            float tmp = mat[k * cols + i];
            mat[k * cols + i] = mat[row_i * cols + i];
            mat[row_i * cols + i] = tmp;
        } else {
            // Swap vector b
            float tmp = b[k];
            b[k] = b[row_i];
            b[row_i] = tmp;
        }
    }

    // Store column k only if within row bounds
    if (i < rows) {
        column_k[i] = mat[i * cols + k];
    }
}