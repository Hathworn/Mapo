#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMult(float *a, float *b, float *c, int m, int n, int k)
{
    __shared__ float tile_a[32][32]; // Allocate shared memory for tiles
    __shared__ float tile_b[32][32];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    for (int tileIdx = 0; tileIdx < (n + 31) / 32; ++tileIdx) {
        // Load data into shared memory with boundary check
        if (row < m && tileIdx * 32 + threadIdx.x < n)
            tile_a[threadIdx.y][threadIdx.x] = a[row * n + tileIdx * 32 + threadIdx.x];
        else
            tile_a[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < k && tileIdx * 32 + threadIdx.y < n)
            tile_b[threadIdx.y][threadIdx.x] = b[(tileIdx * 32 + threadIdx.y) * k + col];
        else
            tile_b[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads(); // Synchronize to ensure all data is loaded

        // Compute partial product for current tile
        for (int i = 0; i < 32; ++i)
            sum += tile_a[threadIdx.y][i] * tile_b[i][threadIdx.x];

        __syncthreads(); // Synchronize before loading new tile
    }

    // Store final result
    if (row < m && col < k)
        c[row * k + col] = sum;
}