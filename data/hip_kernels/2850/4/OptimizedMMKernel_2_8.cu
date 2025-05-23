#include "hip/hip_runtime.h"
#include "includes.h"

/// Tile size used by the OptimizedMMKernel
#define TILE_SIZE 32

/// Naive matrix multiplication CUDA Kernel

/// Tiled 1D Shared Memory No Unrolling

/// Tiled 2D Shared Memory No Unrolling

/// Tiled 2D Shared Memory With Unrolling (4x4 Tile Size)

/// Tiled 2D Shared Memory With Unrolling (8x8 Tile Size)

/// Tiled 2D Shared Memory With Unrolling (16x16 Tile Size)

/// Tiled 2D Shared Memory With Unrolling (32x32 Tile Size)

/// Prints a matrix out to the stderr stream
__global__ void OptimizedMMKernel_2_8(float *a, float *b, float *c, int size)
{
// Create shared matrices for rows of A and columns of B
__shared__ float sharedA[8][8];
__shared__ float sharedB[8][8];

int tx = threadIdx.x;
int ty = threadIdx.y;

int x = blockIdx.x * blockDim.x + tx;
int y = blockIdx.y * blockDim.y + ty;

float sum = 0;

// Divide the matrix up into tiles based on the tile size so each thread
// Can perform its partial sum of the dot product from the shared matrix
int tilesPerGrid = size / blockDim.x;
for (int i = 0; i < tilesPerGrid; i++)
{
// Each thread loads element into A and B
sharedA[ty][tx] = a[(y * size) + (i * 8) + tx];
sharedB[ty][tx] = b[(i * 8 * size) + (ty * size) + x];

// Wait for all threads to load each section of the shared matrix
__syncthreads();

sum += sharedA[ty][0] * sharedB[0][tx];
sum += sharedA[ty][1] * sharedB[1][tx];
sum += sharedA[ty][2] * sharedB[2][tx];
sum += sharedA[ty][3] * sharedB[3][tx];
sum += sharedA[ty][4] * sharedB[4][tx];
sum += sharedA[ty][5] * sharedB[5][tx];
sum += sharedA[ty][6] * sharedB[6][tx];
sum += sharedA[ty][7] * sharedB[7][tx];

// Wait for all threads to compute their partial sum from the shared matrices before loading the next
__syncthreads();
}

// Store the full sum as the result
c[y * size + x] = sum;
}