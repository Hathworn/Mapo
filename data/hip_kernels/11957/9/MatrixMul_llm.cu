#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Shared memory for tiles of Md and Nd
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate the row and column index of the Pd element to work on
    unsigned int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    unsigned int row = blockIdx.y * TILE_WIDTH + threadIdx.y;

    float Pvalue = 0.0f;  // Declare the accumulator outside the loop

    // Loop over the Md and Nd tiles required to compute Pd element
    for (int m = 0; m < (WIDTH + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Collaborative loading of Md and Nd tiles into shared memory
        if (row < WIDTH && (m * TILE_WIDTH + threadIdx.x) < WIDTH)
            Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        else
            Mds[threadIdx.y][threadIdx.x] = 0.0f;  // Handle boundary

        if (col < WIDTH && (m * TILE_WIDTH + threadIdx.y) < WIDTH)
            Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        else
            Nds[threadIdx.y][threadIdx.x] = 0.0f;  // Handle boundary

        __syncthreads();  // Synchronize to ensure tiles are loaded

        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads();  // Synchronize before loading new tiles
    }

    if (row < WIDTH && col < WIDTH)
        Pd[row * WIDTH + col] = Pvalue;  // Save the result to Pd
}