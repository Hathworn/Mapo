#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_WIDTH 16

__global__ void matrixMultiplyAndRelu(float *A, float *B, float *C, float *b, float *T, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Use shared memory tiles for matrix multiplication
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];
    
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;
    
    float Pvalue = 0.0f;

    // Loop over TILE_WIDTH segments
    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Collaborative loading of A and B tiles into shared memory
        if (Row < numARows && m * TILE_WIDTH + tx < numAColumns) {
            ds_M[ty][tx] = A[Row * numAColumns + m * TILE_WIDTH + tx];
        } else {
            ds_M[ty][tx] = 0.0f;
        }
        if (Col < numBColumns && m * TILE_WIDTH + ty < numBRows) {
            ds_N[ty][tx] = B[(m * TILE_WIDTH + ty) * numBColumns + Col];
        } else {
            ds_N[ty][tx] = 0.0f;
        }

        __syncthreads();

        // Matrix multiplication for current tiles
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }

        __syncthreads();
    }

    // Store the result in the global memory
    if (Row < numCRows && Col < numCColumns) {
        float num = Pvalue + b[Row];
        T[Row * numCColumns + Col] = num;
        C[Row * numCColumns + Col] = fmaxf(num, 0.0f);
    }
}