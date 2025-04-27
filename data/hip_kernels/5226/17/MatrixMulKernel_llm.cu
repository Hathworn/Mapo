#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* M, float* N, float* P, int Width) {
    // Cache the row and column into registers to reduce memory access
    int Row = blockIdx.y * blockDim.y + threadIdx.y; // Calculate the row index
    int Col = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the column index

    // Ensure row and column are within matrix bounds
    if (Row < Width && Col < Width) {
        float Pvalue = 0;

        // Use shared memory for input matrices to optimize memory access
        __shared__ float sharedM[TILE_WIDTH][TILE_WIDTH];
        __shared__ float sharedN[TILE_WIDTH][TILE_WIDTH];

        for (int k = 0; k < (Width + TILE_WIDTH - 1) / TILE_WIDTH; ++k) {
            if (Row < Width && k * TILE_WIDTH + threadIdx.x < Width)
                sharedM[threadIdx.y][threadIdx.x] = M[Row * Width + k * TILE_WIDTH + threadIdx.x];
            else
                sharedM[threadIdx.y][threadIdx.x] = 0.0;

            if (Col < Width && k * TILE_WIDTH + threadIdx.y < Width)
                sharedN[threadIdx.y][threadIdx.x] = N[(k * TILE_WIDTH + threadIdx.y) * Width + Col];
            else
                sharedN[threadIdx.y][threadIdx.x] = 0.0;

            __syncthreads();

            for (int j = 0; j < TILE_WIDTH; ++j)
                Pvalue += sharedM[threadIdx.y][j] * sharedN[j][threadIdx.x];

            __syncthreads();
        }

        // Write the result to the output matrix P
        P[Row * Width + Col] = Pvalue;
    }
}
```
