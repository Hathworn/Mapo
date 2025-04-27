#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Define tile width for shared memory

__global__ void MatrixMult(int *M, int *N, int *P, int width)
{
    __shared__ int M_shared[TILE_WIDTH][TILE_WIDTH];  // Shared memory for sub-matrix of M
    __shared__ int N_shared[TILE_WIDTH][TILE_WIDTH];  // Shared memory for sub-matrix of N

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + tx;
    int row = blockIdx.y * TILE_WIDTH + ty;
    int Pv = 0;

    // Loop over tiles
    for (int m = 0; m < (width + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Load M and N tiles into shared memory
        if (row < width && m * TILE_WIDTH + tx < width)
            M_shared[ty][tx] = M[row * width + m * TILE_WIDTH + tx];
        else
            M_shared[ty][tx] = 0;
        
        if (col < width && m * TILE_WIDTH + ty < width)
            N_shared[ty][tx] = N[(m * TILE_WIDTH + ty) * width + col];
        else
            N_shared[ty][tx] = 0;

        __syncthreads();  // Synchronize to ensure tiles are loaded
        
        // Accumulate results for this tile
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pv += M_shared[ty][k] * N_shared[k][tx];
        }

        __syncthreads();  // Synchronize before loading new tiles
    }

    // Write result to global memory
    if (row < width && col < width)
        P[row * width + col] = Pv;
}