```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultiplyShared(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Use shared memory
    __shared__ float ds_A[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_B[TILE_WIDTH][TILE_WIDTH];
    
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int blockX = blockIdx.x;
    int blockY = blockIdx.y;

    // Calculate row and column for the current element
    int row = blockY * TILE_WIDTH + ty;
    int col = blockX * TILE_WIDTH + tx;
    
    float Cval = 0.0;
    
    // Loop over the tiles
    for (int t = 0; t < (numAColumns - 1) / TILE_WIDTH + 1; ++t) {
        
        // Load tiles into shared memory
        if (row < numARows && t * TILE_WIDTH + tx < numAColumns)
            ds_A[ty][tx] = A[row * numAColumns + t * TILE_WIDTH + tx];
        else
            ds_A[ty][tx] = 0.0;
        
        if (col < numBColumns && t * TILE_WIDTH + ty < numBRows)
            ds_B[ty][tx] = B[(t * TILE_WIDTH + ty) * numBColumns + col];
        else
            ds_B[ty][tx] = 0.0;
        
        __syncthreads();
        
        // Accumulate the product
        for (int i = 0; i < TILE_WIDTH; ++i)
            Cval += ds_A[ty][i] * ds_B[i][tx];
        
        __syncthreads();
    }
    
    // Store the result
    if (row < numCRows && col < numCColumns)
        C[row * numCColumns + col] = Cval;
}