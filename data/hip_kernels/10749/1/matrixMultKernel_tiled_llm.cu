#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 16  // Define TILE_SIZE if not already defined

__global__ void matrixMultKernel_tiled(float* Ad, float* Bd, float* Cd, int n)
{
    __shared__ float A_shared[TILE_SIZE][TILE_SIZE];
    __shared__ float B_shared[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * TILE_SIZE + threadIdx.y;
    int column = blockIdx.x * TILE_SIZE + threadIdx.x;

    // Early exit for threads outside matrix bounds
    if (row >= n || column >= n) return;

    float Celem = 0.0;

    // Loop over tiles
    for (int m = 0; m < n / TILE_SIZE; m++)
    {
        // Load tiles into shared memory
        A_shared[threadIdx.y][threadIdx.x] = Ad[row * n + m * TILE_SIZE + threadIdx.x];
        B_shared[threadIdx.y][threadIdx.x] = Bd[(m * TILE_SIZE + threadIdx.y) * n + column];

        __syncthreads(); // Synchronize to make sure the tiles are loaded

        // Compute C element
        for (int k = 0; k < TILE_SIZE; k++)
        {
            Celem += A_shared[threadIdx.y][k] * B_shared[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize before loading new tiles
    }

    // Store the result
    Cd[row * n + column] = Celem;
}