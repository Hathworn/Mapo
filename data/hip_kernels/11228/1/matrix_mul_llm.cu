#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for matrix multiplication
__global__ void matrix_mul(float* d_A, float* d_B, float* d_C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int Row = by*TILE_WIDTH + ty;
    int Col = bx*TILE_WIDTH + tx;

    float Pvalue = 0;

    // Loop over tiles
    for (int m = 0; m < (numAColumns-1)/TILE_WIDTH+1; ++m) 
    {
        // Load data into shared memory with boundary checks
        ds_M[ty][tx] = (Row < numARows && m*TILE_WIDTH+tx < numAColumns) ? d_A[Row*numAColumns + m*TILE_WIDTH+tx] : 0;
        ds_N[ty][tx] = (Col < numBColumns && m*TILE_WIDTH+ty < numBRows) ? d_B[(m*TILE_WIDTH+ty)*numBColumns+Col] : 0;

        // Synchronize threads to ensure data is loaded
        __syncthreads();

        // Compute matrix multiplication on tile
        #pragma unroll // Unroll loop for better performance
        for (int k = 0; k < TILE_WIDTH; ++k)
        {
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        }

        // Synchronize before loading new data into shared memory
        __syncthreads();
    }

    // Write result to global memory
    if (Row < numCRows && Col < numCColumns)
    {
        d_C[Row*numCColumns+Col] = Pvalue;
    }
}