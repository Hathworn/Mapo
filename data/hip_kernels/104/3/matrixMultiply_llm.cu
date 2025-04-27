#include "hip/hip_runtime.h"
#include "includes.h"

// Define TILE WIDTH for shared memory optimization
#define TILE_WIDTH 16

__global__ void matrixMultiply(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Define shared memory tiles
    __shared__ float tileA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float tileB[TILE_WIDTH][TILE_WIDTH];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float value = 0;

    // Loop over tiles j
    for (int j = 0; j < (numAColumns - 1) / TILE_WIDTH + 1; ++j) {
        // Load data into shared memory
        if (row < numARows && j * TILE_WIDTH + threadIdx.x < numAColumns)
            tileA[threadIdx.y][threadIdx.x] = A[row * numAColumns + j * TILE_WIDTH + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0;

        if (col < numBColumns && j * TILE_WIDTH + threadIdx.y < numBRows)
            tileB[threadIdx.y][threadIdx.x] = B[(j * TILE_WIDTH + threadIdx.y) * numBColumns + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0;

        // Synchronize threads
        __syncthreads();

        // Multiply and accumulate the results
        #pragma unroll
        for (int k = 0; k < TILE_WIDTH; ++k)
            value += tileA[threadIdx.y][k] * tileB[k][threadIdx.x];

        // Synchronize threads
        __syncthreads();
    }

    // Write results to C
    if ((row < numCRows) && (col < numCColumns))
        C[row * numCColumns + col] = value;
}