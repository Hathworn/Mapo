```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void MatrixMulKernel(float *M, float *N, float *P, int Width)
{
    // Use shared memory for tiled matrix multiplication
    __shared__ float Ms[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Ns[BLOCK_SIZE][BLOCK_SIZE];

    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    
    int Row = by * blockDim.y + ty;
    int Col = bx * blockDim.x + tx;

    float Pvalue = 0;

    for (int ph = 0; ph < Width / BLOCK_SIZE; ++ph)
    {
        // Collaborative loading of tiles
        if (Row < Width && (ph * BLOCK_SIZE + tx) < Width)
            Ms[ty][tx] = M[Row * Width + ph * BLOCK_SIZE + tx];
        else
            Ms[ty][tx] = 0;
        
        if (Col < Width && (ph * BLOCK_SIZE + ty) < Width)
            Ns[ty][tx] = N[(ph * BLOCK_SIZE + ty) * Width + Col];
        else
            Ns[ty][tx] = 0;
        
        __syncthreads();

        // Accumulate results
        for (int k = 0; k < BLOCK_SIZE; ++k)
            Pvalue += Ms[ty][k] * Ns[k][tx];
        
        __syncthreads();
    }

    // Write results
    if (Row < Width && Col < Width)
        P[Row * Width + Col] = Pvalue;
}