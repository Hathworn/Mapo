#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Shared memory tiles for matrices M and N
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread-specific column and row
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    float Pvalue = 0; // Accumulate the result

    for (int m = 0; m < WIDTH / TILE_WIDTH; m++) {
        // Load tiles into shared memory from global memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads(); // Synchronize threads to ensure all data is loaded

        // Multiply the tiles and accumulate results
        for (int k = 0; k < TILE_WIDTH; k++) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Synchronize threads before loading new tiles
    }

    // Write result to global memory
    Pd[row * WIDTH + col] = Pvalue;
}