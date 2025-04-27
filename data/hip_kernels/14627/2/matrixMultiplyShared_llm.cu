#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultiplyShared(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Define shared memory for tiles
    __shared__ float tileA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float tileB[TILE_WIDTH][TILE_WIDTH];
    
    // Calculate the row and column index in C
    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    
    float value = 0;
    // Loop over all tiles needed
    for (int i = 0; i < (numAColumns - 1) / TILE_WIDTH + 1; ++i) {
        // Load data into shared memory tiles
        if (row < numARows && (i * TILE_WIDTH + threadIdx.x) < numAColumns)
            tileA[threadIdx.y][threadIdx.x] = A[row * numAColumns + i * TILE_WIDTH + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0;

        if (col < numBColumns && (i * TILE_WIDTH + threadIdx.y) < numBRows)
            tileB[threadIdx.y][threadIdx.x] = B[(i * TILE_WIDTH + threadIdx.y) * numBColumns + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Perform multiplication for the current tile
        for (int j = 0; j < TILE_WIDTH; ++j) {
            value += tileA[threadIdx.y][j] * tileB[j][threadIdx.x];
        }
        __syncthreads();
    }

    // Write result to device memory
    if (row < numCRows && col < numCColumns) {
        C[row * numCColumns + col] = value;
    }
}