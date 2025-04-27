#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_WIDTH 16

__global__ void matrixMulCUDA3(float *C, float *A, float *B, int n) {
    // Use shared memory to reduce global memory accesses
    __shared__ float As[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Bs[TILE_WIDTH][TILE_WIDTH];

    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    float C_val = 0;

    for (int k = 0; k < (n + TILE_WIDTH - 1) / TILE_WIDTH; ++k) {
        // Load data into shared memory, check bounds
        if (row < n && k * TILE_WIDTH + threadIdx.x < n)
            As[threadIdx.y][threadIdx.x] = A[row * n + k * TILE_WIDTH + threadIdx.x];
        else
            As[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < n && k * TILE_WIDTH + threadIdx.y < n)
            Bs[threadIdx.y][threadIdx.x] = B[(k * TILE_WIDTH + threadIdx.y) * n + col];
        else
            Bs[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Compute dot product for one tile
        for (int e = 0; e < TILE_WIDTH; ++e)
            C_val += As[threadIdx.y][e] * Bs[e][threadIdx.x];

        __syncthreads();
    }

    // Write the result
    if (row < n && col < n)
        C[row * n + col] = C_val;
}