#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void matrixMul(float *M, float *N, float *P, int width)
{
    // Shared memory for tile
    __shared__ float Ms[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Ns[BLOCK_SIZE][BLOCK_SIZE];

    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    float pValue = 0;

    // Loop over tiles
    for (int tileIdx = 0; tileIdx < width / BLOCK_SIZE; ++tileIdx) {
        int mRow = row;
        int mCol = tileIdx * BLOCK_SIZE + threadIdx.x;
        int nRow = tileIdx * BLOCK_SIZE + threadIdx.y;
        int nCol = col;

        // Load a tile into shared memory
        Ms[threadIdx.y][threadIdx.x] = M[mRow * width + mCol];
        Ns[threadIdx.y][threadIdx.x] = N[nRow * width + nCol];
        __syncthreads();

        // Multiply tile elements
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            pValue += Ms[threadIdx.y][k] * Ns[k][threadIdx.x];
        }
        __syncthreads();
    }

    // Write the result
    if (row < width && col < width) {
        P[row * width + col] = pValue;
    }
}