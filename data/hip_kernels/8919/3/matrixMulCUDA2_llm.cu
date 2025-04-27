```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMulCUDA2(float *C, float *A, float *B, int n)
{
    // Utilize shared memory to reduce global memory accesses
    __shared__ float sharedA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float sharedB[TILE_WIDTH][TILE_WIDTH];

    // Calculate indices for the global memory
    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;

    float sum = 0.0f;

    // Loop over tiles of the input matrices
    for (int tile = 0; tile < (n + TILE_WIDTH - 1) / TILE_WIDTH; ++tile) {
        
        // Load data into shared memory, checking bounds
        if (row < n && tile * TILE_WIDTH + threadIdx.x < n)
            sharedA[threadIdx.y][threadIdx.x] = A[row * n + tile * TILE_WIDTH + threadIdx.x];
        else
            sharedA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < n && tile * TILE_WIDTH + threadIdx.y < n)
            sharedB[threadIdx.y][threadIdx.x] = B[(tile * TILE_WIDTH + threadIdx.y) * n + col];
        else
            sharedB[threadIdx.y][threadIdx.x] = 0.0f;

        // Synchronize to make sure the tile is loaded
        __syncthreads();

        // Perform the computation for the tile
        for (int k = 0; k < TILE_WIDTH; ++k) {
            sum += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];
        }

        // Synchronize to ensure all computations using shared memory are done
        __syncthreads();
    }

    // Store the result in global memory
    if (row < n && col < n) {
        C[row * n + col] = sum;
    }
}