#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_mul_matrix(float *A, float *B, float *C, int col_A, int col_B, int row_C, int col_C) {
    // Shared memory for storing tile data
    __shared__ float tile_A[32][32]; // Use appropriate size based on block dimensions
    __shared__ float tile_B[32][32];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    for (int tile_idx = 0; tile_idx < col_A; tile_idx += blockDim.x) {
        // Load data into shared memory
        if (row < row_C && (tile_idx + threadIdx.x) < col_A)
            tile_A[threadIdx.y][threadIdx.x] = A[row * col_A + (tile_idx + threadIdx.x)];
        else
            tile_A[threadIdx.y][threadIdx.x] = 0;

        if (col < col_C && (tile_idx + threadIdx.y) < col_B)
            tile_B[threadIdx.y][threadIdx.x] = B[(tile_idx + threadIdx.y) * col_B + col];
        else
            tile_B[threadIdx.y][threadIdx.x] = 0;

        __syncthreads();

        // Compute partial product within the tile
        for (int i = 0; i < blockDim.x; ++i) {
            sum += tile_A[threadIdx.y][i] * tile_B[i][threadIdx.x];
        }
        __syncthreads();
    }

    // Write the result to global memory
    if (row < row_C && col < col_C) {
        C[row * col_B + col] = sum;
    }
}