#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define TILE_WIDTH 2

// main fn
__global__ void MatrixMult(int m, int n, int k, float *a, float *b, float *c)
{
    // Use shared memory for efficient data access
    __shared__ float sharedA[TILE_WIDTH][TILE_WIDTH];
    __shared__ float sharedB[TILE_WIDTH][TILE_WIDTH];

    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    float temp = 0.0;

    // Loop over tiles of the input matrices
    for (int tileIdx = 0; tileIdx < (n - 1) / TILE_WIDTH + 1; ++tileIdx) {
        // Load tiles into shared memory
        if (row < m && tileIdx * TILE_WIDTH + threadIdx.x < n) {
            sharedA[threadIdx.y][threadIdx.x] = a[row * n + tileIdx * TILE_WIDTH + threadIdx.x];
        } else {
            sharedA[threadIdx.y][threadIdx.x] = 0.0;
        }
        
        if (col < k && tileIdx * TILE_WIDTH + threadIdx.y < n) {
            sharedB[threadIdx.y][threadIdx.x] = b[(tileIdx * TILE_WIDTH + threadIdx.y) * k + col];
        } else {
            sharedB[threadIdx.y][threadIdx.x] = 0.0;
        }
        
        __syncthreads();

        // Calculate partial sum for this tile
        for (int i = 0; i < TILE_WIDTH; ++i) {
            temp += sharedA[threadIdx.y][i] * sharedB[i][threadIdx.x];
        }
        
        __syncthreads();
    }

    // Write result to global memory
    if (row < m && col < k) {
        c[row * k + col] = temp;
    }
}