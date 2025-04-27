#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* Md, float* Nd, float* Pd, int Width)
{
    // Calculate the row and column indices for Pd
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    if (Row < Width && Col < Width) {  // Ensure within bounds
        float Pvalue = 0.0f;
        
        // Use shared memory for better coalesced access
        __shared__ float Mds[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float Nds[BLOCK_SIZE][BLOCK_SIZE];
        
        for (int m = 0; m < Width / BLOCK_SIZE; ++m) {
            // Collaborative loading into shared memory
            Mds[threadIdx.y][threadIdx.x] = Md[Row * Width + m * BLOCK_SIZE + threadIdx.x];
            Nds[threadIdx.y][threadIdx.x] = Nd[(m * BLOCK_SIZE + threadIdx.y) * Width + Col];
            __syncthreads();

            // Compute Pvalue for this tile
            for (int k = 0; k < BLOCK_SIZE; ++k) {
                Pvalue += Mds[threadIdx.y][k] * Nds[k][threadIdx.x];
            }
            __syncthreads();
        }
        Pd[Row * Width + Col] = Pvalue;
    }
}