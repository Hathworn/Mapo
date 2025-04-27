#include "hip/hip_runtime.h"
#include "includes.h"
#define Tile_size 16  // Increase tile size for better occupancy

// Function To handle any errors occurred in the function calls
__global__ void matrixMultiplyShared(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
    __shared__ float sA[Tile_size][Tile_size];   // Tile size to store elements in shared memory
    __shared__ float sB[Tile_size][Tile_size];

    int Row = blockDim.y * blockIdx.y + threadIdx.y;  // Thread row index
    int Col = blockDim.x * blockIdx.x + threadIdx.x;  // Thread column index
    float Cvalue = 0.0;

    for (int k = 0; k < (((numAColumns - 1) / Tile_size) + 1); k++)
    {
        // Load data into shared memory if within bounds
        if ((Row < numARows) && (threadIdx.x + (k * Tile_size)) < numAColumns)
        {
            sA[threadIdx.y][threadIdx.x] = A[(Row * numAColumns) + threadIdx.x + (k * Tile_size)];
        }
        else
        {
            sA[threadIdx.y][threadIdx.x] = 0.0f;
        }

        if ((Col < numBColumns) && (threadIdx.y + k * Tile_size) < numBRows)
        {
            sB[threadIdx.y][threadIdx.x] = B[(threadIdx.y + k * Tile_size) * numBColumns + Col];
        }
        else
        {
            sB[threadIdx.y][threadIdx.x] = 0.0f;
        }

        __syncthreads();  // Ensure all threads have loaded their data

        // Perform computation
        #pragma unroll
        for (int j = 0; j < Tile_size; ++j)
        {
            Cvalue += sA[threadIdx.y][j] * sB[j][threadIdx.x];
        }

        __syncthreads();  // Ensure all threads have completed computation before loading new data
    }

    // Store the result in global memory
    if (Row < numCRows && Col < numCColumns)
    {
        C[Row * numCColumns + Col] = Cvalue;
    }
}