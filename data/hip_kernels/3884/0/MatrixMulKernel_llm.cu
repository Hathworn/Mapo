#include "hip/hip_runtime.h"
#include "includes.h"

#define N 8 // size of the matrices to be multiplied
#define TILE_WIDTH 4 // size of the tiles

__global__ void MatrixMulKernel(float* d_M, float* d_N, float* d_P, int Width) {
    __shared__ float ds_M[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_N[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;  
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;

    // Identify the row and column of the Pd element to work on
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0.0f; // Use float for consistency and efficiency
    // Loop over the Md and Nd tiles required to compute the Pd element
    for (int m = 0; m < Width / TILE_WIDTH; ++m) {
        // Collaborative loading of Md and Nd tiles into shared memory
        if (Row < Width && (m*TILE_WIDTH+tx) < Width)
            ds_M[ty][tx] = d_M[Row * Width + m * TILE_WIDTH + tx];
        else
            ds_M[ty][tx] = 0.0f;

        if ((m*TILE_WIDTH+ty) < Width && Col < Width)
            ds_N[ty][tx] = d_N[(m * TILE_WIDTH + ty) * Width + Col];
        else
            ds_N[ty][tx] = 0.0f;
        
        __syncthreads();
        
        // Compute tiles
        for (int k = 0; k < TILE_WIDTH; ++k)
            Pvalue += ds_M[ty][k] * ds_N[k][tx];
        
        __syncthreads();
    }
    
    // Write the computed value to the matrix P
    if (Row < Width && Col < Width)
        d_P[Row * Width + Col] = Pvalue;
}