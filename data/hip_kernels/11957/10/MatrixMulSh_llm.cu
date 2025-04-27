#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Use shared memory to store tiles from Md and Nd
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread row and column within the grid
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;
    float Pvalue = 0.0f; // Accumulator for the resulting element

    // Loop over all the tiles needed for the computation
    for (int m = 0; m < WIDTH / TILE_WIDTH; m++) {
        // Load Md and Nd tiles into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads(); // Ensure all threads have loaded their tile elements

        // Matrix multiplication for the current tile
        for (int k = 0; k < TILE_WIDTH; k++) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Ensure all threads have completed using the tiles
    }

    // Write the computed value to the output matrix
    Pd[row * WIDTH + col] = Pvalue;
}