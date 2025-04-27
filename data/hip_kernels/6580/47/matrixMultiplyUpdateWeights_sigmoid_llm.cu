#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void matrixMultiplyUpdateWeights_sigmoid(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns, float learning_rate) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x, by = blockIdx.y,
        tx = threadIdx.x, ty = threadIdx.y,
        Row = by * TILE_WIDTH + ty,
        Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0;

    // Iterate through tiles of A and B
    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Collaborative loading of tiles into shared memory
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
        
        // Matrix multiplication within the tile
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }
        
        __syncthreads();
    }

    // Write the result to the output matrix
    if (Row < numCRows && Col < numCColumns) {
        C[Row * numCColumns + Col] -= learning_rate * (Pvalue / numAColumns);
    }
}