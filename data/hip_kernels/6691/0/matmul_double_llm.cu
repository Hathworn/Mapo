#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matmul_double(double* A, double* B , double* C, int M, int N, int K)
{
    // Thread and block indices
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate row and column indices
    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    // Allocate shared memory
    __shared__ double SA[TILE_WIDTH][TILE_WIDTH];
    __shared__ double SB[TILE_WIDTH][TILE_WIDTH];

    double Csub = 0;

    for (int i = 0; i < (K + TILE_WIDTH - 1) / TILE_WIDTH; ++i)
    {
        // Load elements into shared memory with boundary checks
        if (row < M && i * TILE_WIDTH + tx < K) {
            SA[ty][tx] = A[row * K + i * TILE_WIDTH + tx];
        } else {
            SA[ty][tx] = 0.0;
        }

        if (col < N && i * TILE_WIDTH + ty < K) {
            SB[ty][tx] = B[(i * TILE_WIDTH + ty) * N + col];
        } else {
            SB[ty][tx] = 0.0;
        }

        __syncthreads();

        // Compute partial product for the tile
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Csub += SA[ty][k] * SB[k][tx];
        }

        __syncthreads();
    }

    // Write result to global memory if within bounds
    if (row < M && col < N) {
        C[row * N + col] = Csub;
    }
}