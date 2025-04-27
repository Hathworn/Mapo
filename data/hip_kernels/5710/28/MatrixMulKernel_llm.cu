#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel (float* Md, float* Nd, float* Pd, int ncols) {

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the thread is within matrix boundaries
    if (row < ncols && col < ncols) {
        float Pvalue = 0.0f;
        // Use shared memory for faster access
        __shared__ float Mds[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float Nds[BLOCK_SIZE][BLOCK_SIZE];

        for (int k = 0; k < (ncols + BLOCK_SIZE - 1) / BLOCK_SIZE; ++k) {
            // Load data into shared memory
            if (row < ncols && (k * BLOCK_SIZE + threadIdx.x) < ncols) {
                Mds[threadIdx.y][threadIdx.x] = Md[row * ncols + k * BLOCK_SIZE + threadIdx.x];
            } else {
                Mds[threadIdx.y][threadIdx.x] = 0.0f;
            }
            
            if (col < ncols && (k * BLOCK_SIZE + threadIdx.y) < ncols) {
                Nds[threadIdx.y][threadIdx.x] = Nd[(k * BLOCK_SIZE + threadIdx.y) * ncols + col];
            } else {
                Nds[threadIdx.y][threadIdx.x] = 0.0f;
            }
            
            // Ensure all threads have loaded their segment into shared memory
            __syncthreads();

            for (int n = 0; n < BLOCK_SIZE; ++n) {
                Pvalue += Mds[threadIdx.y][n] * Nds[n][threadIdx.x];
            }
            
            // Ensure all threads are done computing using current shared memory segment
            __syncthreads();
        }
        
        Pd[row * ncols + col] = Pvalue;
    }
}