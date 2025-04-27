#include "hip/hip_runtime.h"
#include "includes.h"

/// Tile size used by the OptimizedMMKernel
#define TILE_SIZE 32

/// Prints a matrix out to the stderr stream
__global__ void NaiveMMKernel(float *a, float *b, float *c, int size)
{
    int xOut = blockDim.x * blockIdx.x + threadIdx.x;
    int yOut = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if thread is within matrix dimensions
    if (xOut < size && yOut < size) {
        float outValue = 0;
        
        // Using shared memory for a and b
        __shared__ float aTile[TILE_SIZE][TILE_SIZE];
        __shared__ float bTile[TILE_SIZE][TILE_SIZE];

        for (int i = 0; i < size; i += TILE_SIZE) {
            // Load data into shared memory
            aTile[threadIdx.y][threadIdx.x] = a[yOut * size + (i + threadIdx.x)];
            bTile[threadIdx.y][threadIdx.x] = b[(i + threadIdx.y) * size + xOut];
            
            __syncthreads();  // Synchronize to ensure all data is loaded

            // Perform partial dot product
            for (int j = 0; j < TILE_SIZE; ++j) {
                outValue += aTile[threadIdx.y][j] * bTile[j][threadIdx.x];
            }

            __syncthreads();  // Synchronize after computation
        }

        // Store sum of dot products in C matrix
        c[yOut * size + xOut] = outValue;
    }
}