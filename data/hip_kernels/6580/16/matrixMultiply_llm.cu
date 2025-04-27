#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0;

    for (int m = 0; m < (numAColumns - 1) / TILE_WIDTH + 1; ++m) {
        // Load A and B tiles into shared memory
        int tiledRow = m * TILE_WIDTH + tx;
        int tiledCol = m * TILE_WIDTH + ty;
        
        ds_M[ty][tx] = (Row < numARows && tiledRow < numAColumns) ? A[Row * numAColumns + tiledRow] : 0;
        ds_N[ty][tx] = (Col < numBColumns && tiledCol < numBRows) ? B[tiledCol * numBColumns + Col] : 0;

        __syncthreads();

        // Compute partial product
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }

        __syncthreads();
    }
    // Write the result to C
    if (Row < numCRows && Col < numCColumns) {
        C[Row * numCColumns + Col] = Pvalue;
    }
}