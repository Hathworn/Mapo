#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Define TILE_WIDTH appropriately based on your GPU hardware.

__global__ void matrixMultiplyAndSoftmax(float * A, float * B, float * C, float* b, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];
    int bx = blockIdx.x, by = blockIdx.y,
        tx = threadIdx.x, ty = threadIdx.y,
        Row = by * TILE_WIDTH + ty,
        Col = bx * TILE_WIDTH + tx;
    float Pvalue = 0;

    for (int m = 0; m < (numAColumns - 1) / TILE_WIDTH + 1; ++m) {
        // Load tiles of A and B into shared memory with bounds checking.
        if (Row < numARows && m * TILE_WIDTH + tx < numAColumns)
            ds_M[ty][tx] = A[Row * numAColumns + m * TILE_WIDTH + tx];
        else
            ds_M[ty][tx] = 0.0f;

        if (Col < numBColumns && m * TILE_WIDTH + ty < numBRows)
            ds_N[ty][tx] = B[(m * TILE_WIDTH + ty) * numBColumns + Col];
        else
            ds_N[ty][tx] = 0.0f;

        __syncthreads();

        // Perform computation on the tiles.
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }

        __syncthreads();
    }

    // Write result to C if within bounds.
    if (Row < numCRows && Col < numCColumns) {
        C[Row * numCColumns + Col] = Pvalue + b[Row];
    }
}