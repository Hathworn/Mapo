#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrix_mult_kernel_tiled(int *d_m, int *d_n, int *d_p, int m, int n, int k) {
    __shared__ int ds_m[TILE_WIDTH][TILE_WIDTH];
    __shared__ int ds_n[TILE_WIDTH][TILE_WIDTH];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    int row = by * TILE_WIDTH + ty;
    int col = bx * TILE_WIDTH + tx;

    int pvalue = 0;

    for (int i = 0; i < (k + TILE_WIDTH - 1) / TILE_WIDTH; ++i) {
        // Load shared memory with bounds checks
        if (row < m && i * TILE_WIDTH + tx < k) 
            ds_m[ty][tx] = d_m[row * k + i * TILE_WIDTH + tx];
        else 
            ds_m[ty][tx] = 0;
        
        if (col < n && i * TILE_WIDTH + ty < k) 
            ds_n[ty][tx] = d_n[(i * TILE_WIDTH + ty) * n + col];
        else 
            ds_n[ty][tx] = 0;

        __syncthreads(); // Ensure loading is complete

        #pragma unroll
        for (int j = 0; j < TILE_WIDTH; j++) 
            pvalue += ds_m[ty][j] * ds_n[j][tx];

        __syncthreads(); // Prepare for next iteration
    }

    // Write result to global memory
    if (row < m && col < n) 
        d_p[row * n + col] = pvalue;
}