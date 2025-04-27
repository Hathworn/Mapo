#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void gpuSmMM(float *Ad, float *Bd, float *Cd, int dimension) {
    // Define shared memory for tiles
    __shared__ float Ads[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Bds[TILE_WIDTH][TILE_WIDTH];
    
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;
    float Cvalue = 0.0f;  // Initialize accumulation result to 0
    
    // Iterate over tiles
    for (int m = 0; m < dimension / TILE_WIDTH; ++m) {
        // Load tiles into shared memory
        Ads[threadIdx.y][threadIdx.x] = Ad[row * dimension + (m * TILE_WIDTH + threadIdx.x)];
        Bds[threadIdx.y][threadIdx.x] = Bd[(m * TILE_WIDTH + threadIdx.y) * dimension + col];
        
        __syncthreads();  // Synchronize threads after loading tiles

        // Perform the partial multiplication for the current tile
        for (int k1 = 0; k1 < TILE_WIDTH; ++k1) {
            Cvalue += Ads[threadIdx.y][k1] * Bds[k1][threadIdx.x];
        }

        __syncthreads();  // Synchronize before loading the next tile
    }

    // Write result to C matrix
    Cd[row * dimension + col] = Cvalue;
}