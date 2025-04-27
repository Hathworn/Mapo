#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose(int *src, int *dest) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate column index
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate row index
    
    // Bounds checking
    if (x >= WIDTH || y >= HEIGHT) return;

    __shared__ int tile[TILE_DIM][TILE_DIM]; // Use shared memory for tiled access
    
    // Load data into shared memory tile
    tile[threadIdx.y][threadIdx.x] = src[y * WIDTH + x]; 
    __syncthreads(); // Synchronize threads to ensure complete data load

    // Write transposed data from shared memory
    int trans_x = blockIdx.y * blockDim.y + threadIdx.x; // Calculate destination column index
    int trans_y = blockIdx.x * blockDim.x + threadIdx.y; // Calculate destination row index
    
    if (trans_x < HEIGHT && trans_y < WIDTH) {
        dest[trans_y * HEIGHT + trans_x] = tile[threadIdx.x][threadIdx.y];
    }
}