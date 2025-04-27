#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulSh(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Use shared memory for tiles
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    // Calculate thread coordinates
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize register for accumulation to reduce global memory accesses
    float Pvalue = 0;

    for (int m = 0; m < WIDTH / TILE_WIDTH; m++) {
        // Load Md and Nd tiles into shared memory
        Mds[threadIdx.y][threadIdx.x] = Md[row * WIDTH + (m * TILE_WIDTH + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(m * TILE_WIDTH + threadIdx.y) * WIDTH + col];
        __syncthreads();  // Synchronize threads after loading

        // Perform computation on tiles
        for (int k = 0; k < TILE_WIDTH; k++) {
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads();  // Synchronize threads before starting next tile phase
    }

    // Store result in global memory
    Pd[row * WIDTH + col] = Pvalue;
}