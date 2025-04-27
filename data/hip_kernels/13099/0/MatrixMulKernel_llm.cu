#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* d_M, float* d_N, float* d_P, int Width) 
{
    // Calculate the row index of the d_P element and d_M
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate the column index of d_P and d_N
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better memory access patterns
    __shared__ float s_M[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float s_N[BLOCK_SIZE][BLOCK_SIZE];

    float Pvalue = 0;

    for (int k = 0; k < (Width + BLOCK_SIZE - 1) / BLOCK_SIZE; ++k) {
        // Load data into shared memory
        if ((Row < Width) && (k * BLOCK_SIZE + threadIdx.x < Width))
            s_M[threadIdx.y][threadIdx.x] = d_M[Row * Width + k * BLOCK_SIZE + threadIdx.x];
        else
            s_M[threadIdx.y][threadIdx.x] = 0.0;

        if ((Col < Width) && (k * BLOCK_SIZE + threadIdx.y < Width))
            s_N[threadIdx.y][threadIdx.x] = d_N[(k * BLOCK_SIZE + threadIdx.y) * Width + Col];
        else
            s_N[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Perform partial computation
        for (int n = 0; n < BLOCK_SIZE; ++n)
            Pvalue += s_M[threadIdx.y][n] * s_N[n][threadIdx.x];
        
        __syncthreads();
    }

    // Store the result in the global memory
    if ((Row < Width) && (Col < Width))
        d_P[Row * Width + Col] = Pvalue;
}