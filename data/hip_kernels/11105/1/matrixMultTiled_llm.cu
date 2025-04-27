#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMultTiled(float* d_A, float* d_B, float* d_C, int width) {
    __shared__ float ds_A[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_B[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Identify the row and column of the d_P element to work on
    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float ans = 0;
    // Loop over the d_M and d_N tiles required to compute d_P element
    for(int m = 0; m < (width + TILE_WIDTH - 1) / TILE_WIDTH; m++) {
        // Load tiles into shared memory with boundary check
        if(m * TILE_WIDTH + tx < width && Row < width)
            ds_A[ty][tx] = d_A[Row * width + m * TILE_WIDTH + tx];
        else
            ds_A[ty][tx] = 0.0f;

        if(m * TILE_WIDTH + ty < width && Col < width)
            ds_B[ty][tx] = d_B[(m * TILE_WIDTH + ty) * width + Col];
        else
            ds_B[ty][tx] = 0.0f;

        __syncthreads();

        // Perform computation
        for(int k = 0; k < TILE_WIDTH; k++) {
            ans += ds_A[ty][k] * ds_B[k][tx];
        }
        __syncthreads();
    }
    
    // Write result to global memory
    if(Row < width && Col < width)
        d_C[Row * width + Col] = ans;
}