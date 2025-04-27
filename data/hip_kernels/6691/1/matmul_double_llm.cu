#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matmul_double(double* A, double* B ,  double* C, int M, int N, int K)
{
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    // Align shared memory for better performance in coalesced access
    __shared__ double SA[TILE_WIDTH][TILE_WIDTH + 1];
    __shared__ double SB[TILE_WIDTH][TILE_WIDTH + 1];

    double Csub = 0;

    // Loop over the A and B tiles required to compute the C element
    for (int i = 0; i < (K - 1) / TILE_WIDTH + 1; ++i)
    {
        // Load A and B tiles into shared memory; ensure boundary checks
        if ((row < M) && (i * TILE_WIDTH + tx < K)) {
            SA[ty][tx] = A[row * K + i * TILE_WIDTH + tx];
        } else {
            SA[ty][tx] = 0;
        }

        if ((col < N) && (i * TILE_WIDTH + ty < K)) {
            SB[tx][ty] = B[col * K + i * TILE_WIDTH + ty];
        } else {
            SB[tx][ty] = 0;
        }

        __syncthreads(); // Synchronize to wait for tile data to be loaded

        // Compute matrix multiplication for the tile
        #pragma unroll // Unroll the loop for better performance
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Csub += SA[ty][k] * SB[tx][k];
        }

        __syncthreads(); // Ensure all threads have finished using shared memory
    }

    // Write the block sub-matrix to global memory
    if ((row < M) && (col < N)) {
        C[row * N + col] = Csub;
    }
}