#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void OptimizedMMKernel_1(float *a, float *b, float *c, int size)
{
    __shared__ float sharedA[TILE_SIZE][TILE_SIZE];
    __shared__ float sharedB[TILE_SIZE][TILE_SIZE];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * blockDim.x + tx;
    int y = blockIdx.y * blockDim.y + ty;

    float sum = 0;
    int tilesPerGrid = size / TILE_SIZE;

    for (int i = 0; i < tilesPerGrid; i++)
    {
        // Load elements into shared memory; leverage memory coalescing
        sharedA[ty][tx] = a[y * size + i * TILE_SIZE + tx];
        sharedB[ty][tx] = b[(i * TILE_SIZE + ty) * size + x];

        __syncthreads();  // Synchronize after loading tiles

        #pragma unroll  // Unroll inner loop for better performance
        for (int j = 0; j < TILE_SIZE; j++)
        {
            sum += sharedA[ty][j] * sharedB[j][tx];
        }

        __syncthreads();  // Synchronize to ensure completion of all operations
    }
    
    // Store computed value into the output matrix
    c[y * size + x] = sum;
}