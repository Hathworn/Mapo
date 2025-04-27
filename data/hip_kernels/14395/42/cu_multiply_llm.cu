#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

// Optimized global kernel function
__global__ void cu_multiply(const float* A, const float* B, float* C, int rowsa, int colsa, int rowsb, int colsb, int rowsc, int colsc) {
    __shared__ float sA[TILE_SIZE][TILE_SIZE];    // Tile size of 32x32
    __shared__ float sB[TILE_SIZE][TILE_SIZE];

    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;
    float Cvalue = 0.0;

    for (int k = 0; k < (colsa + TILE_SIZE - 1) / TILE_SIZE; k++) {
        int tiledRow = threadIdx.y + k * TILE_SIZE;
        
        // Load A into shared memory
        if (Row < rowsa && tiledRow < colsa) {
            sA[threadIdx.y][threadIdx.x] = A[Row * colsa + tiledRow];
        } else {
            sA[threadIdx.y][threadIdx.x] = 0.0;
        }

        // Load B into shared memory
        int tiledCol = threadIdx.y + k * TILE_SIZE;
        if (Col < colsb && tiledCol < rowsb) {
            sB[threadIdx.y][threadIdx.x] = B[tiledCol * colsb + Col];
        } else {
            sB[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads();

        // Compute partial result
        for (int j = 0; j < TILE_SIZE; ++j) {
            Cvalue += sA[threadIdx.y][j] * sB[j][threadIdx.x];
        }

        __syncthreads();
    }

    // Store result
    if (Row < rowsc && Col < colsc) {
        C[Row * colsc + Col] = Cvalue;
    }
}