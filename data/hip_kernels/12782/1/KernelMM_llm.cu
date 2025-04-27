#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32 // Define tile size for shared memory usage

__global__ void KernelMM(int N, int M, int P, float *A, float *B, float *C) {

    __shared__ float sA[TILE_SIZE][TILE_SIZE]; // Use tile size for shared memory
    __shared__ float sB[TILE_SIZE][TILE_SIZE];

    int bx = blockIdx.x;  int by = blockIdx.y;
    int tx = threadIdx.x; int ty = threadIdx.y;
    int row = by * TILE_SIZE + ty;
    int col = bx * TILE_SIZE + tx;

    float tmp = 0.0f; // Use float literal for clarity

    for (int m = 0; m < (P + TILE_SIZE - 1) / TILE_SIZE; m++) {
        // Load data into shared memory with boundary checks
        if (row < N && m * TILE_SIZE + tx < P)
            sA[ty][tx] = A[row * P + m * TILE_SIZE + tx];
        else
            sA[ty][tx] = 0.0f;

        if (col < M && m * TILE_SIZE + ty < P)
            sB[ty][tx] = B[(m * TILE_SIZE + ty) * M + col];
        else
            sB[ty][tx] = 0.0f;

        __syncthreads();

        for (int k = 0; k < TILE_SIZE; k++)
            tmp += sA[ty][k] * sB[k][tx];

        __syncthreads();
    }

    if (row < N && col < M)
        C[row * M + col] = tmp;
}