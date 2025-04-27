#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 32

__global__ void matrixMultiplyShared(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
    __shared__ float sA[TILE_SIZE][TILE_SIZE]; // Shared memory tiles
    __shared__ float sB[TILE_SIZE][TILE_SIZE];

    int Row = blockDim.y * blockIdx.y + threadIdx.y; // Row index of C in global memory
    int Col = blockDim.x * blockIdx.x + threadIdx.x; // Column index of C in global memory
    float Cvalue = 0.0;

    for (int k = 0; k < (numAColumns + TILE_SIZE - 1) / TILE_SIZE; ++k)
    {
        // Collaborative loading of Tiles into shared memory
        if (Row < numARows && threadIdx.x + k * TILE_SIZE < numAColumns)
        {
            sA[threadIdx.y][threadIdx.x] = A[Row * numAColumns + threadIdx.x + k * TILE_SIZE];
        }
        else
        {
            sA[threadIdx.y][threadIdx.x] = 0.0;
        }

        if (Col < numBColumns && threadIdx.y + k * TILE_SIZE < numBRows)
        {
            sB[threadIdx.y][threadIdx.x] = B[(threadIdx.y + k * TILE_SIZE) * numBColumns + Col];
        }
        else
        {
            sB[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads(); // Ensure tiles are loaded

        // Perform the computation
        for (int j = 0; j < TILE_SIZE; ++j)
        {
            Cvalue += sA[threadIdx.y][j] * sB[j][threadIdx.x];
        }

        __syncthreads(); // Ensure computation uses same shared memory
    }

    // Write result to C
    if (Row < numCRows && Col < numCColumns)
    {
        C[Row * numCColumns + Col] = Cvalue;
    }
}