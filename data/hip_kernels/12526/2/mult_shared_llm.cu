#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_DIM BLOCK_X

__global__ void mult_shared(int *A, int *B, int *result, int n) {
    const int col = blockIdx.x * TILE_DIM + threadIdx.x;
    const int row = blockIdx.y * TILE_DIM + threadIdx.y;

    __shared__ int tileA[TILE_DIM][TILE_DIM];
    __shared__ int tileB[TILE_DIM][TILE_DIM];

    int c = 0;

    for (int k = 0; k < n; k += TILE_DIM) {
        // Load shared memory tiles conditionally
        if (k + threadIdx.y < n && col < n)
            tileA[threadIdx.y][threadIdx.x] = A[col * n + k + threadIdx.y];
        else
            tileA[threadIdx.y][threadIdx.x] = 0;

        if (k + threadIdx.x < n && row < n)
            tileB[threadIdx.y][threadIdx.x] = B[(k + threadIdx.y) * n + row];
        else
            tileB[threadIdx.y][threadIdx.x] = 0;

        __syncthreads(); // Synchronize all threads before computation

        // Compute partial results using shared tiles
        for (int kk = 0; kk < TILE_DIM; kk++) {
            c += tileA[threadIdx.y][kk] * tileB[kk][threadIdx.x];
        }

        __syncthreads(); // Synchronize all threads before loading the next tile
    }

    if (col < n && row < n)
        result[col * n + row] = c;
}