#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecmul(float *A, float* B, float *C, int size)
{
    // Optimized: cache for better memory bandwidth usage
    __shared__ float sharedA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float sharedB[BLOCK_SIZE][BLOCK_SIZE];

    // Calculate block row and column
    int blockRow = blockIdx.y * blockDim.y;
    int blockCol = blockIdx.x * blockDim.x;

    // Row and Column indexes:
    int row = blockRow + threadIdx.y;
    int col = blockCol + threadIdx.x;

    float result = 0;

    // Iterate over tiles
    for (int tileIdx = 0; tileIdx < size; tileIdx += BLOCK_SIZE) {

        // Load elements into shared memory
        if (row < size && (tileIdx + threadIdx.x) < size) {
            sharedA[threadIdx.y][threadIdx.x] = A[row * size + tileIdx + threadIdx.x];
        } else {
            sharedA[threadIdx.y][threadIdx.x] = 0.0;
        }

        if ((tileIdx + threadIdx.y) < size && col < size) {
            sharedB[threadIdx.y][threadIdx.x] = B[(tileIdx + threadIdx.y) * size + col];
        } else {
            sharedB[threadIdx.y][threadIdx.x] = 0.0;
        }

        // Synchronize before computation
        __syncthreads();

        // Compute partial result
        for (int ix = 0; ix < BLOCK_SIZE; ix++) {
            result += sharedA[threadIdx.y][ix] * sharedB[ix][threadIdx.x];
        }

        // Synchronize again before next tile
        __syncthreads();
    }

    // Store the result
    if (row < size && col < size) {
        C[row * size + col] = result;
    }
}