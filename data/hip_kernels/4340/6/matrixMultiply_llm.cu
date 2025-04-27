#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Define TILE_WIDTH for clarity

__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Optimizing shared memory allocation
    __shared__ float ds_A[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_B[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Cvalue = 0;

    // Loop over the A and B tiles required to compute the C element
    for (int t = 0; t < (numAColumns - 1) / TILE_WIDTH + 1; ++t) {
        // Avoid unnecessary divergence by loading within bounds
        if (Row < numARows && t * TILE_WIDTH + tx < numAColumns) {
            ds_A[ty][tx] = A[Row * numAColumns + t * TILE_WIDTH + tx];
        } else {
            ds_A[ty][tx] = 0.0;
        }

        if (t * TILE_WIDTH + ty < numBRows && Col < numBColumns) {
            ds_B[ty][tx] = B[(t * TILE_WIDTH + ty) * numBColumns + Col];
        } else {
            ds_B[ty][tx] = 0.0;
        }

        __syncthreads();

        // Use loop unrolling for better performance on matrix multiplication
        #pragma unroll
        for (int i = 0; i < TILE_WIDTH; ++i) {
            Cvalue += ds_A[ty][i] * ds_B[i][tx];
        }
        __syncthreads();
    }
  
    if (Row < numARows && Col < numBColumns) {
        C[Row * numBColumns + Col] = Cvalue;
    }
}