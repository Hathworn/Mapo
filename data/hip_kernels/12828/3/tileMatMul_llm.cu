#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tileMatMul(float* matA, float* matB, float* matC, int aRows, int aCols, int bRows, int bCols, int cRows, int cCols)
{
    // Define row and column values
    int Row = blockIdx.y * TILE_DIM + threadIdx.y;
    int Col = blockIdx.x * TILE_DIM + threadIdx.x;

    // Shared memory arrays
    __shared__ float sharedMatA[TILE_DIM][TILE_DIM];
    __shared__ float sharedMatB[TILE_DIM][TILE_DIM];

    float cResultValue = 0.0f;

    // Calculate tiled matrix multiplication using shared memory
    for(int i = 0; i < (aCols - 1) / TILE_DIM + 1; ++i) {
        // Load elements of matA into shared memory
        if(Row < aRows && i * TILE_DIM + threadIdx.x < aCols) {
            sharedMatA[threadIdx.y][threadIdx.x] = matA[Row * aCols + i * TILE_DIM + threadIdx.x];
        } else {
            sharedMatA[threadIdx.y][threadIdx.x] = 0.0f;
        }

        // Load elements of matB into shared memory
        if(Col < bCols && i * TILE_DIM + threadIdx.y < bRows) { // Fixed to check bounds with bRows
            sharedMatB[threadIdx.y][threadIdx.x] = matB[(i * TILE_DIM + threadIdx.y) * bCols + Col];
        } else {
            sharedMatB[threadIdx.y][threadIdx.x] = 0.0f;
        }

        __syncthreads();

        // Compute partial product for this tile
        for(int j = 0; j < TILE_DIM; ++j) {
            cResultValue += sharedMatA[threadIdx.y][j] * sharedMatB[j][threadIdx.x];
        }
        
        __syncthreads();
    }

    // Write the result to the output matrix
    if(Row < cRows && Col < cCols) {
        matC[Row * cCols + Col] = cResultValue;
    }
}