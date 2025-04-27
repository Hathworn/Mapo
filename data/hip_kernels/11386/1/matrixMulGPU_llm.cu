#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulGPU(int* a, int* b, int* c)
{
    // Use shared memory to improve data locality.
    __shared__ int sharedA[TILE_WIDTH][TILE_WIDTH];
    __shared__ int sharedB[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Identify the row and column of the Pd element to work on.
    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;
    int val = 0;

    // Loop over the a and b tiles required to compute the c element.
    for (int m = 0; m < (N - 1) / TILE_WIDTH + 1; ++m)
    {
        // Load tiles into shared memory, checking bounds.
        if (m * TILE_WIDTH + tx < N && row < N)
            sharedA[ty][tx] = a[row * N + m * TILE_WIDTH + tx];
        else
            sharedA[ty][tx] = 0;

        if (m * TILE_WIDTH + ty < N && col < N)
            sharedB[ty][tx] = b[(m * TILE_WIDTH + ty) * N + col];
        else
            sharedB[ty][tx] = 0;

        // Synchronize to make sure the sub-matrices are loaded.
        __syncthreads();

        for (int k = 0; k < TILE_WIDTH; ++k)
            val += sharedA[ty][k] * sharedB[k][tx];

        // Synchronize to make sure that the preceding computation is done before loading new sub-matrices in the next iteration.
        __syncthreads();
    }

    // Write the block sub-matrix to global memory, checking bounds.
    if (row < N && col < N)
        c[row * N + col] = val;
}