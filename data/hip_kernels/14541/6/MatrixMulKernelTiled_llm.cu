#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMulKernelTiled(float* Md, float* Nd, float* Pd, int Width)
{
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;
    float Pvalue = 0;

    // Loop over tiles
    for (int m = 0; m < (Width - 1) / TILE_WIDTH + 1; ++m) {
        // Load tiles into shared memory, check bounds
        if (Row < Width && m * TILE_WIDTH + tx < Width)
            Mds[ty][tx] = Md[Row * Width + m * TILE_WIDTH + tx];
        else
            Mds[ty][tx] = 0.0f;
        
        if (Col < Width && m * TILE_WIDTH + ty < Width)
            Nds[ty][tx] = Nd[(m * TILE_WIDTH + ty) * Width + Col];
        else
            Nds[ty][tx] = 0.0f;

        __syncthreads();

        for (int k = 0; k < TILE_WIDTH; ++k)
            Pvalue += Mds[ty][k] * Nds[k][tx];

        __syncthreads();
    }

    // Write back result only if within bounds
    if (Row < Width && Col < Width)
        Pd[Row * Width + Col] = Pvalue;
}