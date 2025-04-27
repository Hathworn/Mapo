#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_Mul_Kernel(float* d_M, float* d_N, float* d_P, int Width) {
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0;

    for (int ph = 0; ph < Width / TILE_WIDTH; ++ph) {
        // Use coalesced memory access patterns
        if(Row < Width && (ph * TILE_WIDTH + tx) < Width)
            Mds[ty][tx] = d_M[Row * Width + ph * TILE_WIDTH + tx];
        else
            Mds[ty][tx] = 0.0;

        if(Col < Width && (ph * TILE_WIDTH + ty) < Width)
            Nds[ty][tx] = d_N[(ph * TILE_WIDTH + ty) * Width + Col];
        else
            Nds[ty][tx] = 0.0;

        __syncthreads(); // Synchronize threads to ensure shared memory is updated

        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += Mds[ty][k] * Nds[k][tx];
        }
        __syncthreads(); // Synchronize to prepare for the next tile
    }

    if(Row < Width && Col < Width)
        d_P[Row * Width + Col] = Pvalue;
}