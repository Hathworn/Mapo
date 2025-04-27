#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMul_kernel(float * A, float * B, float * C, int N)
{
    const int TILE_WIDTH = 16;
    __shared__ float tileA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float tileB[TILE_WIDTH][TILE_WIDTH];

    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    float tmpSum = 0.0f; // Temporary sum for the element

    for (int t = 0; t < (N - 1) / TILE_WIDTH + 1; ++t) {
        // Collaborative loading of data into shared memory
        if (row < N && t * TILE_WIDTH + threadIdx.x < N)
            tileA[threadIdx.y][threadIdx.x] = A[row * N + t * TILE_WIDTH + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < N && t * TILE_WIDTH + threadIdx.y < N)
            tileB[threadIdx.y][threadIdx.x] = B[(t * TILE_WIDTH + threadIdx.y) * N + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads(); // Ensure all threads have loaded their data

        // Perform computation on the tile
        for (int i = 0; i < TILE_WIDTH; ++i) {
            tmpSum += tileA[threadIdx.y][i] * tileB[i][threadIdx.x];
        }
        __syncthreads(); // Ensure all threads have finished computing on the current tile
    }

    // Write the result back to the global memory
    if (row < N && col < N)
        C[row * N + col] = tmpSum;
}