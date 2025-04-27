#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 16 // Define the size of the tile

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Allocate shared memory for tiles
    __shared__ float Mds[TILE_SIZE][TILE_SIZE];
    __shared__ float Nds[TILE_SIZE][TILE_SIZE];

    // Calculate row and column index for matrix P
    unsigned int col = TILE_SIZE * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_SIZE * blockIdx.y + threadIdx.y;

    float Pvalue = 0; // Initialize Pvalue for the current element

    // Loop over tiles
    for (int t = 0; t < (WIDTH + TILE_SIZE - 1) / TILE_SIZE; t++) {
        // Collaborative loading of Md and Nd tiles into shared memory
        if (t * TILE_SIZE + threadIdx.x < WIDTH && row < WIDTH) {
            Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + t * TILE_SIZE + threadIdx.x];
        } else {
            Mds[threadIdx.y][threadIdx.x] = 0.0;
        }
      
        if (t * TILE_SIZE + threadIdx.y < WIDTH && col < WIDTH) {
            Nds[threadIdx.y][threadIdx.x] = Nd[(t * TILE_SIZE + threadIdx.y) * WIDTH + col];
        } else {
            Nds[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads(); // Ensure matrices are loaded

        // Multiply tiles
        for (int k = 0; k < TILE_SIZE; k++) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize threads
    }

    // Write the result to the output matrix
    if (row < WIDTH && col < WIDTH) {
        Pd[row * WIDTH + col] = Pvalue;
    }
}