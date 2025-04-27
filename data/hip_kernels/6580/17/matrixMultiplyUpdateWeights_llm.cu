#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMultiplyUpdateWeights(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns, float learning_rate) {
    // Shared memory to enhance data reuse
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    // Block and thread indices
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;
    float Pvalue = 0;

    // Loop over the tiles of A and B in phases
    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Load tile of matrix A into shared memory
        if (Row < numARows && m * TILE_WIDTH + tx < numAColumns)
            ds_M[ty][tx] = A[Row * numAColumns + m * TILE_WIDTH + tx];
        else
            ds_M[ty][tx] = 0.0;

        // Load tile of matrix B into shared memory
        if (Col < numBColumns && m * TILE_WIDTH + ty < numBRows)
            ds_N[ty][tx] = B[(m * TILE_WIDTH + ty) * numBColumns + Col];
        else
            ds_N[ty][tx] = 0.0;

        // Synchronize to ensure all tiles are loaded
        __syncthreads();
        
        // Compute contribution of this tile to P
        for (int k = 0; k < TILE_WIDTH; ++k)
            Pvalue += ds_M[ty][k] * ds_N[k][tx];

        // Synchronize to wait for computation before loading next tile
        __syncthreads();
    }

    // Write the result into matrix C
    if (Row < numCRows && Col < numCColumns)
        C[Row * numCColumns + Col] -= learning_rate * (Pvalue / numAColumns);
}