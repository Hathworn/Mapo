#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16  // Define a tile width for shared memory usage

__global__ void MatrixMulKernel(float* M, float* N, float* P, int Width) {
    // Shared memory declaration for optimization
    __shared__ float M_shared[TILE_WIDTH][TILE_WIDTH];
    __shared__ float N_shared[TILE_WIDTH][TILE_WIDTH];

    int Row = blockIdx.y * blockDim.y + threadIdx.y; // Calculate the row index of the P element and M
    int Col = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the column index of P and N

    float Pvalue = 0.0;
    
    // Loop over tiles
    for (int m = 0; m < (Width + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        // Load elements into shared memory for M and N
        if (Row < Width && m * TILE_WIDTH + threadIdx.x < Width)
            M_shared[threadIdx.y][threadIdx.x] = M[Row * Width + m * TILE_WIDTH + threadIdx.x];
        else
            M_shared[threadIdx.y][threadIdx.x] = 0.0;

        if (Col < Width && m * TILE_WIDTH + threadIdx.y < Width)
            N_shared[threadIdx.y][threadIdx.x] = N[(m * TILE_WIDTH + threadIdx.y) * Width + Col];
        else
            N_shared[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads(); // Synchronize threads to ensure shared memory loads are done

        // Compute each thread's partial dot product
        for (int k = 0; k < TILE_WIDTH; ++k) {
            Pvalue += M_shared[threadIdx.y][k] * N_shared[k][threadIdx.x];
        }

        __syncthreads(); // Synchronize before loading new data into shared memory
    }

    // Write back the result to global memory
    if (Row < Width && Col < Width) {
        P[Row * Width + Col] = Pvalue;
    }
}