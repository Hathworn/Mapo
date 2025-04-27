#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMult (int *a, int *b, int *c, int width)
{
    // Using shared memory for tiles
    __shared__ int tileA[32][32];
    __shared__ int tileB[32][32];

    int row = threadIdx.y + blockDim.y * blockIdx.y;
    int col = threadIdx.x + blockDim.x * blockIdx.x;
    int sum = 0;

    for (int m = 0; m < width / 32; ++m) {
        // Load elements into shared memory
        if (row < width && (m * 32 + threadIdx.x) < width)
            tileA[threadIdx.y][threadIdx.x] = a[row * width + m * 32 + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0;
        
        if (col < width && (m * 32 + threadIdx.y) < width)
            tileB[threadIdx.y][threadIdx.x] = b[(m * 32 + threadIdx.y) * width + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0;

        // Synchronize threads to ensure all elements are loaded
        __syncthreads();

        // Compute partial results for this tile
        for (int k = 0; k < 32; ++k)
            sum += tileA[threadIdx.y][k] * tileB[k][threadIdx.x];

        // Synchronize threads to prepare for loading the next tile
        __syncthreads();
    }

    // Write the result
    if (row < width && col < width)
        c[row * width + col] = sum;
}