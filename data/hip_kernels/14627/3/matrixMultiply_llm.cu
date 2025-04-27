#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Shared memory for tiles
    __shared__ float tileA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float tileB[TILE_WIDTH][TILE_WIDTH];

    // Compute thread indices
    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;

    float Cvalue = 0.0;

    // Loop over tiles
    for (int t = 0; t < (numAColumns-1)/TILE_WIDTH + 1; ++t) {
        if (row < numARows && t*TILE_WIDTH + threadIdx.x < numAColumns)
            tileA[threadIdx.y][threadIdx.x] = A[row*numAColumns + t*TILE_WIDTH + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0;

        if (col < numBColumns && t*TILE_WIDTH + threadIdx.y < numBRows)
            tileB[threadIdx.y][threadIdx.x] = B[(t*TILE_WIDTH + threadIdx.y)*numBColumns + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0;

        // Synchronize to ensure tiles are loaded
        __syncthreads();

        // Multiply the two tiles together
        for (int i = 0; i < TILE_WIDTH; ++i)
            Cvalue += tileA[threadIdx.y][i] * tileB[i][threadIdx.x];

        // Synchronize to ensure all threads completed multiplication
        __syncthreads();
    }

    // Write the block sub-matrix to the output matrix
    if (row < numCRows && col < numCColumns)
        C[row*numCColumns + col] = Cvalue;
}