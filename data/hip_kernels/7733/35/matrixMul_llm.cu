#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double *a, double *b, double *C, int cols, int rows, int cols2) {
    // Get unique row and column index for this thread
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Allocate shared memory for tiles of a and b
    __shared__ double tileA[TILE_DIM][TILE_DIM];
    __shared__ double tileB[TILE_DIM][TILE_DIM];
    
    double value = 0;
    
    // Iterate over tiles
    for (int t = 0; t < (cols2 + TILE_DIM - 1) / TILE_DIM; ++t) {
        // Load data into tiles
        if (row < rows && t * TILE_DIM + threadIdx.y < cols2) {
            tileA[threadIdx.x][threadIdx.y] = a[row * cols2 + t * TILE_DIM + threadIdx.y];
        } else {
            tileA[threadIdx.x][threadIdx.y] = 0.0;
        }
        
        if (col < cols && t * TILE_DIM + threadIdx.x < cols2) {
            tileB[threadIdx.x][threadIdx.y] = b[(t * TILE_DIM + threadIdx.x) * cols + col];
        } else {
            tileB[threadIdx.x][threadIdx.y] = 0.0;
        }
        
        // Synchronize threads to ensure tiles are fully loaded
        __syncthreads();
        
        // Perform multiplication within the tile
        for (int k = 0; k < TILE_DIM; ++k) {
            value += tileA[threadIdx.x][k] * tileB[k][threadIdx.y];
        }
        
        // Synchronize before loading next tile
        __syncthreads();
    }
    
    // Write the result to global memory
    if (row < rows && col < cols) {
        C[row * cols + col] = value;
    }
}