#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Use shared memory to optimize memory access
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    float Pvalue = 0;

    // Loop through tiles
    for (int m = 0; m < WIDTH / TILE_WIDTH; ++m) {
        // Load data into shared memory with coalesced access
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        
        __syncthreads(); // Synchronize to ensure data is loaded

        // Perform the computation for a tile
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize to prevent race conditions
    }

    // Write the result to the matrix P
    Pd[row * WIDTH + col] = Pvalue;
}