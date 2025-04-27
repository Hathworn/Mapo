#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 40

__global__ void matrixMultiplySharedMem(double * A, double * B, double * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Declare shared memory for tiles
    __shared__ double ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ double ds_N[TILE_WIDTH][TILE_WIDTH];

    // Calculate row and column index of C matrix
    int bx = blockIdx.x, by = blockIdx.y,
        tx = threadIdx.x, ty = threadIdx.y,
        Row = by * TILE_WIDTH + ty,
        Col = bx * TILE_WIDTH + tx;

    double Pvalue = 0;

    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Load data into shared memory with boundary check
        if (Row < numARows && m * TILE_WIDTH + tx < numAColumns)
            ds_M[ty][tx] = A[Row * numAColumns + m * TILE_WIDTH + tx];
        else
            ds_M[ty][tx] = 0.0;

        if (Col < numBColumns && m * TILE_WIDTH + ty < numBRows)
            ds_N[ty][tx] = B[(m * TILE_WIDTH + ty) * numBColumns + Col];
        else
            ds_N[ty][tx] = 0.0;

        __syncthreads();

        // Perform multiplication for the current tile
        #pragma unroll
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }

        __syncthreads();
    }

    // Store result in C if valid index
    if (Row < numCRows && Col < numCColumns)
        C[Row * numCColumns + Col] = Pvalue;
}