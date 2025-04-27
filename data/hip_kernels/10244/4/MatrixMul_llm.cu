#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize Pvalue to accumulate the result
    float Pvalue = 0;

    // Use shared memory for tiling
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    for (int m = 0; m < WIDTH / TILE_WIDTH; ++m) {
        // Collaboratively load tiles into shared memory
        if (row < WIDTH && m * TILE_WIDTH + threadIdx.x < WIDTH)
            Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + m * TILE_WIDTH + threadIdx.x];
        else
            Mds[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < WIDTH && m * TILE_WIDTH + threadIdx.y < WIDTH)
            Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        else
            Nds[threadIdx.y][threadIdx.x] = 0.0f;

        // Synchronize to make sure the matrices are loaded
        __syncthreads();

        // Multiply the tiles
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }

        // Synchronize to ensure that the preceding computation is done before loading two new tiles
        __syncthreads();
    }

    // Write the block's result to device memory
    if (row < WIDTH && col < WIDTH)
        Pd[row * WIDTH + col] = Pvalue;
}