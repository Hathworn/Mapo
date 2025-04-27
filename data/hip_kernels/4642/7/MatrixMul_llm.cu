#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *a, float *b, float *c, int m, int n, int k)
{
    // Use shared memory for block-level matrix multiplication
    __shared__ float tileA[TILE_SIZE][TILE_SIZE];
    __shared__ float tileB[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    for (int t = 0; t < (n - 1) / TILE_SIZE + 1; ++t) {
        // Load data into shared memory
        if (row < m && t*TILE_SIZE + threadIdx.x < n)
            tileA[threadIdx.y][threadIdx.x] = a[row * n + t*TILE_SIZE + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < k && t*TILE_SIZE + threadIdx.y < n)
            tileB[threadIdx.y][threadIdx.x] = b[(t*TILE_SIZE + threadIdx.y) * k + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Perform block-level matrix multiplication
        for (int i = 0; i < TILE_SIZE; ++i) {
            sum += tileA[threadIdx.y][i] * tileB[i][threadIdx.x];
        }

        __syncthreads();
    }

    // Store the result
    if (row < m && col < k) {
        c[row * k + col] = sum;
    }
}