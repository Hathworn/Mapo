#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Assuming TILE_WIDTH is pre-defined

__global__ void MatrixMulKernel(float *d_M, float *d_N, float *d_P, int width) {
    __shared__ float Mds[TILE_WIDTH][TILE_WIDTH];
    __shared__ float Nds[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x; 
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    float Pvalue = 0.0f;

    // Unroll the loop over width/TILE_WIDTH
    for (int i = 0; i < width / TILE_WIDTH; ++i) {
        // Load elements into shared memory
        if (row < width && (i * TILE_WIDTH + tx) < width)
            Mds[ty][tx] = d_M[row * width + i * TILE_WIDTH + tx];
        else
            Mds[ty][tx] = 0.0f;
        
        if ((i * TILE_WIDTH + ty) < width && col < width)
            Nds[ty][tx] = d_N[(i * TILE_WIDTH + ty) * width + col];
        else
            Nds[ty][tx] = 0.0f;
            
        __syncthreads();

        // Compute partial product
        #pragma unroll
        for (int j = 0; j < TILE_WIDTH; ++j) {
            Pvalue += Mds[ty][j] * Nds[j][tx];
        }
        __syncthreads();
    }

    // Write the result back to the global memory
    if (row < width && col < width)
        d_P[row * width + col] = Pvalue;
}