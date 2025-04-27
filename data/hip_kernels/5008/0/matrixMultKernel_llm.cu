#include "hip/hip_runtime.h"
#include "includes.h"

#define N 1200
#define THREADS 1024

__global__ void matrixMultKernel (double *a, double *b, double *c, int n)
{
    // Thread and block index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    double v = 0;

    // Shared memory for tiles of A and B
    __shared__ double a_tile[32][32];
    __shared__ double b_tile[32][32];

    for (int i = 0; i < n; i += blockDim.x) {
        // Load elements into shared memory
        if (row < n && (i + threadIdx.x) < n)
            a_tile[threadIdx.y][threadIdx.x] = a[row * n + i + threadIdx.x];
        else
            a_tile[threadIdx.y][threadIdx.x] = 0.0;

        if (col < n && (i + threadIdx.y) < n)
            b_tile[threadIdx.y][threadIdx.x] = b[(i + threadIdx.y) * n + col];
        else
            b_tile[threadIdx.y][threadIdx.x] = 0.0;

        // Synchronize to make sure the sub-matrices are loaded
        __syncthreads();

        // Each thread computes one element in the block sub-matrix
        for (int j = 0; j < blockDim.x; j++) {
            v += a_tile[threadIdx.y][j] * b_tile[j][threadIdx.x];
        }

        // Synchronize to ensure computation is done before loading new sub-matrices
        __syncthreads();
    }

    // Write the result
    if (row < n && col < n) {
        c[row * n + col] = v;
    }
}