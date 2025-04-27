#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* Md, float* Nd, float* Pd, int Width)
{
    // Calculate the row index of the Pd element and M
    int Row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    // Calculate the column index of Pd and N
    int Col = blockIdx.x * BLOCK_SIZE + threadIdx.x;

    float Pvalue = 0;
    // Use shared memory to optimize memory access
    __shared__ float Mds[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Nds[BLOCK_SIZE][BLOCK_SIZE];
  
    for (int tileIdx = 0; tileIdx < Width / BLOCK_SIZE; ++tileIdx) {
        // Load data into shared memory from Md and Nd
        Mds[threadIdx.y][threadIdx.x] = Md[Row * Width + (tileIdx * BLOCK_SIZE + threadIdx.x)];
        Nds[threadIdx.y][threadIdx.x] = Nd[(tileIdx * BLOCK_SIZE + threadIdx.y) * Width + Col];
        __syncthreads(); // Synchronize threads to ensure all data is loaded

        for (int k = 0; k < BLOCK_SIZE; ++k) {
            // Accumulate results for a block
            Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
        }
        __syncthreads(); // Synchronize threads before loading new data
    }

    Pd[Row * Width + Col] = Pvalue;
}