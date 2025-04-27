#include "hip/hip_runtime.h"
#include "includes.h"
#define Tile_size 64

int numARows = 1024;   // number of rows in the matrix A
int numAColumns = 1024;  // number of columns in the matrix A
int numBRows = 1024;   // number of rows in the matrix B
int numBColumns = 1024;  // number of columns in the matrix B
int numCRows = 1024;  // number of rows in the matrix C (you have to set this)
int numCColumns = 1024; // number of columns in the matrix C (you have to set this)

//*************************************************************
__global__ void matrixMultiplyShared(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
    // Shared memory allocation for sub-matrices
    __shared__ float sA[Tile_size][Tile_size];
    __shared__ float sB[Tile_size][Tile_size];

    // Calculate thread's row and column in global matrix
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    float Cvalue = 0.0f;

    // Loop through tiles of A and B
    for (int k = 0; k < (numAColumns + Tile_size - 1) / Tile_size; ++k)
    {
        // Collaborative loading of A into shared memory
        if (Row < numARows && (k * Tile_size + threadIdx.x) < numAColumns)
        {
            sA[threadIdx.y][threadIdx.x] = A[Row * numAColumns + k * Tile_size + threadIdx.x];
        }
        else
        {
            sA[threadIdx.y][threadIdx.x] = 0.0f;
        }

        // Collaborative loading of B into shared memory
        if (Col < numBColumns && (k * Tile_size + threadIdx.y) < numBRows)
        {
            sB[threadIdx.y][threadIdx.x] = B[(k * Tile_size + threadIdx.y) * numBColumns + Col];
        }
        else
        {
            sB[threadIdx.y][threadIdx.x] = 0.0f;
        }

        // Ensure all threads have loaded their tiles
        __syncthreads();

        // Compute the tile on the shared memory
        for (int j = 0; j < Tile_size; ++j)
        {
            Cvalue += sA[threadIdx.y][j] * sB[j][threadIdx.x];
        }

        // Synchronize to ensure all threads are done computing
        __syncthreads();
    }

    // Write back the result to the global memory
    if (Row < numCRows && Col < numCColumns)
    {
        C[Row * numCColumns + Col] = Cvalue;
    }
}