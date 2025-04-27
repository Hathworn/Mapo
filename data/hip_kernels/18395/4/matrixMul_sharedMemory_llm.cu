#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul_sharedMemory(float *M, float *N, float *P, int m, int j, int n)
{
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float pValue = 0.0f;

    // Use integer division and multiplication to avoid floating-point operations
    int numPhases = (j + TILE_WIDTH - 1) / TILE_WIDTH;

    for(int ph = 0; ph < numPhases; ph++)
    {
        // Load elements into shared memory if within bounds
        if(Row < m && ph * TILE_WIDTH + tx < j)
            Mds[ty][tx] = M[Row * j + ph * TILE_WIDTH + tx];
        else
            Mds[ty][tx] = 0.0f; // Avoid undefined values

        if(Col < n && ph * TILE_WIDTH + ty < j)
            Nds[ty][tx] = N[(ph * TILE_WIDTH + ty) * n + Col];
        else
            Nds[ty][tx] = 0.0f; // Avoid undefined values
        
        __syncthreads();

        // Accumulate results
        for(int k = 0; k < TILE_WIDTH; k++)
        {
            pValue += Mds[ty][k] * Nds[k][tx];
        }
        
        __syncthreads();
    }

    // Store result if within output matrix bounds
    if(Row < m && Col < n)
        P[Row * n + Col] = pValue;
}