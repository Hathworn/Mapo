#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 7

__global__ void MatrixMulKernel(float* Md, float* Nd, float* Pd, int Width)
{
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x; int by = blockIdx.y;
    int tx = threadIdx.x; int ty = threadIdx.y;

    // Identify the row and column of the Pd element to work on
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0;

    // Loop over the Md and Nd tiles required to compute the Pd element
    for (int m = 0; m < (Width + TILE_WIDTH - 1) / TILE_WIDTH; m++)
    {
        // Check bounds before loading to avoid out-of-bounds access
        if (Row < Width && m * TILE_WIDTH + tx < Width)
            Mds[ty][tx] = Md[Row * Width + m * TILE_WIDTH + tx];
        else
            Mds[ty][tx] = 0.0;

        if (Col < Width && m * TILE_WIDTH + ty < Width)
            Nds[ty][tx] = Nd[(m * TILE_WIDTH + ty) * Width + Col];
        else
            Nds[ty][tx] = 0.0;
        
        __syncthreads();

        // Accumulate the partial results
        for (int k = 0; k < TILE_WIDTH; k++)
            Pvalue += Mds[ty][k] * Nds[k][tx];
        
        __syncthreads();
    }

    // Check bounds before storing to avoid out-of-bounds access
    if (Row < Width && Col < Width)
        Pd[Row * Width + Col] = Pvalue;
}