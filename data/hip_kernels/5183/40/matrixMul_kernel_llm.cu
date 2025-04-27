#include "hip/hip_runtime.h"
#include "includes.h"

// Macro for tile size
#define TILE_SIZE 16

__global__ void matrixMul_kernel(float *A, float *B, float *C, int N)
{
    // Shared memory for tiles
    __shared__ float tileA[TILE_SIZE][TILE_SIZE];
    __shared__ float tileB[TILE_SIZE][TILE_SIZE];

    int ROW = blockIdx.y * TILE_SIZE + threadIdx.y;
    int COL = blockIdx.x * TILE_SIZE + threadIdx.x;
    float tmpSum = 0.0f;

    // Loop over tiles
    for (int m = 0; m < N / TILE_SIZE; m++)
    {
        // Load data into shared memory
        if (ROW < N && m * TILE_SIZE + threadIdx.x < N)
            tileA[threadIdx.y][threadIdx.x] = A[ROW * N + m * TILE_SIZE + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0f;

        if (COL < N && m * TILE_SIZE + threadIdx.y < N)
            tileB[threadIdx.y][threadIdx.x] = B[(m * TILE_SIZE + threadIdx.y) * N + COL];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Perform computation for tiles
        for (int k = 0; k < TILE_SIZE; k++)
        {
            tmpSum += tileA[threadIdx.y][k] * tileB[k][threadIdx.x];
        }
        
        __syncthreads();
    }

    // Write the result to global memory
    if (ROW < N && COL < N)
    {
        C[ROW * N + COL] = tmpSum;
    }
}