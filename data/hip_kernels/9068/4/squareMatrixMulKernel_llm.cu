#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_SIZE 16

__global__ void squareMatrixMulKernel(int *c, int *a, int *b, int arrayWidth)
{
    // Allocate shared memory for tiles of input matrices
    __shared__ float tileA[TILE_SIZE][TILE_SIZE];
    __shared__ float tileB[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * TILE_SIZE + threadIdx.y;
    int col = blockIdx.x * TILE_SIZE + threadIdx.x;

    float sum = 0;

    // Iterate over tiles
    for (int tileIdx = 0; tileIdx < arrayWidth/TILE_SIZE; ++tileIdx) {
        // Load data into shared memory for the current tile
        tileA[threadIdx.y][threadIdx.x] = a[row * arrayWidth + tileIdx * TILE_SIZE + threadIdx.x];
        tileB[threadIdx.y][threadIdx.x] = b[(tileIdx * TILE_SIZE + threadIdx.y) * arrayWidth + col];

        // Synchronize threads to ensure all data is loaded
        __syncthreads();

        // Perform tile matrix multiplication
        for (int i = 0; i < TILE_SIZE; ++i) {
            sum += tileA[threadIdx.y][i] * tileB[i][threadIdx.x];
        }

        // Synchronize threads before loading next tile
        __syncthreads();
    }

    // Write the result into global memory
    c[row * arrayWidth + col] = sum;
}