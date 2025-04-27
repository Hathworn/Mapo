#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void OptimizedMMKernel_2_4(float *a, float *b, float *c, int size)
{
    // Create shared matrices for rows of A and columns of B
    __shared__ float sharedA[4][4];
    __shared__ float sharedB[4][4];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int x = blockIdx.x * blockDim.x + tx;
    int y = blockIdx.y * blockDim.y + ty;

    float sum = 0;

    // Optimize tile calculation to reduce division
    int tilesPerGrid = size >> 2; 

    for (int i = 0; i < tilesPerGrid; i++)
    {
        // Each thread loads element into A and B
        sharedA[ty][tx] = a[(y * size) + (i << 2) + tx];  // Use bitshift for multiplication
        sharedB[ty][tx] = b[(i << 2) * size + (ty * size) + x]; // Use bitshift for multiplication

        // Wait for all threads to load section of the shared matrices
        __syncthreads();
        
        // Unroll sum updates
        sum += sharedA[ty][0] * sharedB[0][tx];  
        sum += sharedA[ty][1] * sharedB[1][tx];
        sum += sharedA[ty][2] * sharedB[2][tx];
        sum += sharedA[ty][3] * sharedB[3][tx];

        // Wait for all threads to compute their partial sum before next tile
        __syncthreads();
    }

    // Store the full sum as the result
    c[y * size + x] = sum;
}