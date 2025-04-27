#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tiled_matrix_multiplication(int *A, int *B, int *C) {

    __shared__ int As[TILE_WIDTH][TILE_WIDTH];
    __shared__ int Bs[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    int res = 0;

    for(int i = 0; i < M/TILE_WIDTH; i++) {
        // Load data into shared memory more efficiently
        int a_index = row * M + (i * TILE_WIDTH + tx);
        int b_index = (i * TILE_WIDTH + ty) * M + col;
        
        As[ty][tx] = A[a_index];
        Bs[ty][tx] = B[b_index];

        __syncthreads();

        // Multiply and accumulate
        for(int j = 0; j < TILE_WIDTH; j++) {
            res += As[ty][j] * Bs[j][tx]; // Fixing the operation to multiplication
        }

        __syncthreads();
    }

    // Store final result
    C[row * M + col] = res;
}