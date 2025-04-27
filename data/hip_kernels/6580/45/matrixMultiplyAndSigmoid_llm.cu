#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void matrixMultiplyAndSigmoid(float* A, float* B, float* C, float* b, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0;

    // Loop over tiles
    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        if (Row < numARows && m * TILE_WIDTH + tx < numAColumns)
            ds_M[ty][tx] = A[Row * numAColumns + m * TILE_WIDTH + tx];
        else
            ds_M[ty][tx] = 0;

        if (Col < numBColumns && m * TILE_WIDTH + ty < numBRows)
            ds_N[ty][tx] = B[(m * TILE_WIDTH + ty) * numBColumns + Col];
        else
            ds_N[ty][tx] = 0;

        __syncthreads();

        // Unroll the loop for better performance
        for (int k = 0; k < TILE_WIDTH; k += 4) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
            Pvalue += ds_M[ty][k + 1] * ds_N[k + 1][tx];
            Pvalue += ds_M[ty][k + 2] * ds_N[k + 2][tx];
            Pvalue += ds_M[ty][k + 3] * ds_N[k + 3][tx];
        }

        __syncthreads();
    }

    // Write result to matrix C
    if (Row < numCRows && Col < numCColumns)
        C[Row * numCColumns + Col] = sigmoid(Pvalue + b[Row]);
}
```
