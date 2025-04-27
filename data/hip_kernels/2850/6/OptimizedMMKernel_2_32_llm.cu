#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void OptimizedMMKernel_2_32(float *a, float *b, float *c, int size)
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
        // Load elements from global to shared memory
        sharedA[ty][tx] = a[y * size + (i * TILE_SIZE + tx)];
        sharedB[ty][tx] = b[(i * TILE_SIZE * size) + ty * size + x];

        __syncthreads();  // Ensure all threads have loaded the matrices

        #pragma unroll  // Unroll loop for performance improvement
        for (int j = 0; j < TILE_SIZE; j++) {
            sum += sharedA[ty][j] * sharedB[j][tx];
        }
        
        __syncthreads();  // Ensure computation using current tile is done
    }

    c[y * size + x] = sum;  // Write result to global memory
}