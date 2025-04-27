#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMultiplyAndTanh(float * A, float * B, float * C, float* b, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];
    
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;
    float Pvalue = 0;

    // Loop over TILE_WIDTH-sized sub-matrices
    for (int m = 0; m < (numAColumns + TILE_WIDTH - 1)/TILE_WIDTH; ++m) {
        // Load A into shared memory
        if (Row < numARows && m*TILE_WIDTH + tx < numAColumns) {
            ds_M[ty][tx] = A[Row * numAColumns + m*TILE_WIDTH + tx];
        } else {
            ds_M[ty][tx] = 0.0f;
        }
        
        // Load B into shared memory
        if (Col < numBColumns && m*TILE_WIDTH + ty < numBRows) {
            ds_N[ty][tx] = B[(m*TILE_WIDTH + ty) * numBColumns + Col];
        } else {
            ds_N[ty][tx] = 0.0f;
        }

        __syncthreads();

        // Matrix multiplication
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }
        
        __syncthreads();
    }

    // Apply tanh activation function
    if (Row < numCRows && Col < numCColumns) {
        C[Row*numCColumns + Col] = tanhf(Pvalue + b[Row]); // Use fast math function
    }
}