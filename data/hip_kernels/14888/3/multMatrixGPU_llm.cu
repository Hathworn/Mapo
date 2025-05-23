#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float f(float x) {
    return 4.f / (1.f + x * x);
}

__global__ void multMatrixGPU(const float *matrixA, const size_t rowA, const size_t columnA, const float *matrixB, const size_t rowB, const size_t columnB, float *matrixC) {
    __shared__ float ds_A[TILE_SIZE][TILE_SIZE];
    __shared__ float ds_B[TILE_SIZE][TILE_SIZE];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int row = blockIdx.y * blockDim.y + ty;
    int col = blockIdx.x * blockDim.x + tx;

    float cValue = 0.0;
    
    // Loop over tiles required for the computation
    for (int t = 0; t < (columnA + TILE_SIZE - 1) / TILE_SIZE; t++) {
      
        // Load matrixA and matrixB tiles into shared memory, using boundary checks
        if (row < rowA && t * TILE_SIZE + tx < columnA) {
            ds_A[ty][tx] = matrixA[row * columnA + t * TILE_SIZE + tx];
        } else {
            ds_A[ty][tx] = 0.0f;
        }

        if (col < columnB && t * TILE_SIZE + ty < rowB) {
            ds_B[ty][tx] = matrixB[(t * TILE_SIZE + ty) * columnB + col];
        } else {
            ds_B[ty][tx] = 0.0f;
        }

        __syncthreads();

        // Compute resulting matrix element by iterating over the shared memory tile
        for (int i = 0; i < TILE_SIZE; i++) {
            cValue += ds_A[ty][i] * ds_B[i][tx];
        }

        __syncthreads();
    }

    // Write result to matrixC only if within bounds
    if (row < rowA && col < columnB) {
        matrixC[row * columnB + col] = cValue;
    }
}