#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void OptimizedMMKernel_0(float *a, float *b, float *c, int size)
{
    // Shared memory to store the tiles of matrices A and B
    __shared__ float sharedA[TILE_SIZE][TILE_SIZE];
    __shared__ float sharedB[TILE_SIZE][TILE_SIZE];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int x = blockIdx.x * blockDim.x + tx;
    int y = blockIdx.y * blockDim.y + ty;

    float sum = 0.0f;

    int tilesPerGrid = size / TILE_SIZE;
    for (int i = 0; i < tilesPerGrid; i++)
    {
        // Each thread loads one element of the A and B tiles.
        sharedA[ty][tx] = a[y * size + (i * TILE_SIZE + tx)];
        sharedB[ty][tx] = b[(i * TILE_SIZE + ty) * size + x];

        // Synchronize to make sure the tile is loaded before using it
        __syncthreads();

        #pragma unroll // Unroll for loop for performance
        for (int j = 0; j < TILE_SIZE; j++)
        {
            sum += sharedA[ty][j] * sharedB[j][tx];
        }

        // Synchronize before computing next tile
        __syncthreads();
    }

    // Write the result to the output matrix C
    c[y * size + x] = sum;
}