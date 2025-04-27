#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Define tile size

__device__ float rowcol_dot(float *matrix_a, float *matrix_b, int row, int col, int N) {
    float val = 0;
    for (int k = 0; k < N; k++) {
        val += matrix_a[row * N + k] * matrix_b[col + k * N];
    }
    return val;
}

__global__ void matrix_mult_ker(float *matrix_a, float *matrix_b, float *output_matrix, int N) {
    __shared__ float tile_a[TILE_WIDTH][TILE_WIDTH];
    __shared__ float tile_b[TILE_WIDTH][TILE_WIDTH];

    int tile_row = threadIdx.y;
    int tile_col = threadIdx.x;
    int row = blockIdx.y * blockDim.y + tile_row;
    int col = blockIdx.x * blockDim.x + tile_col;

    float value = 0.0f;

    for (int p = 0; p < N / TILE_WIDTH; p++) {
        // Load data into shared memory
        tile_a[tile_row][tile_col] = matrix_a[row * N + (p * TILE_WIDTH + tile_col)];
        tile_b[tile_row][tile_col] = matrix_b[(p * TILE_WIDTH + tile_row) * N + col];

        __syncthreads(); // Ensure all threads have written to shared memory

        // Perform block-based multiplication
        for (int k = 0; k < TILE_WIDTH; k++) {
            value += tile_a[tile_row][k] * tile_b[k][tile_col];
        }

        __syncthreads(); // Wait for all threads to complete the computation
    }

    if (row < N && col < N) {
        output_matrix[row * N + col] = value; // Write result to global memory
    }
}