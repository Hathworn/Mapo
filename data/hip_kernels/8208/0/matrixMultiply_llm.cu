#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Calculate row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    float pValue = 0;

    // Ensure within bounds
    if (row < numCRows && col < numCColumns) {
        // Accumulate result
        for (int k = 0; k < numAColumns; k++) {
            pValue += A[row * numAColumns + k] * B[k * numBColumns + col];
        }
        // Write to output matrix
        C[row * numCColumns + col] = pValue;
    }
}