#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gemm(float* A, float* B, float* C, int m, int n, int k) {
    // Block row and column
    int blockRow = blockIdx.y;
    int blockCol = blockIdx.x;

    // Thread row and column within Csub
    int row = threadIdx.y;
    int col = threadIdx.x;

    // Each thread block computes one sub-matrix Csub of C
    float* Csub = &C[BLOCK_SIZE * k * blockRow + BLOCK_SIZE * blockCol];

    // Shared memory used to store Asub and Bsub respectively
    __shared__ float As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE];
    
    // Each thread computes one element of Csub by accumulating results into Cvalue
    float Cvalue = 0.0;

    // Loop over all the sub-matrices of A and B that are required to compute Csub
    for (int i = 0; i < (n / BLOCK_SIZE); ++i) {
        // Get sub-matrix Asub of A and Bsub of B
        float* Asub = &A[BLOCK_SIZE * blockRow * n + BLOCK_SIZE * i];
        float* Bsub = &B[BLOCK_SIZE * k * i + BLOCK_SIZE * blockCol];
        
        // Load Asub and Bsub from device memory to shared memory
        As[row][col] = Asub[row * n + col];
        Bs[row][col] = Bsub[row * k + col];

        // Synchronize to make sure the sub-matrices are loaded before starting the computation
        __syncthreads();

        // Unroll loop for better performance
        #pragma unroll
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            Cvalue += As[row][j] * Bs[j][col];
        }

        // Synchronize to make sure that the preceding computation is done before loading two new sub-matrices of A and B in the next iteration
        __syncthreads();
    }

    // Write Csub to device memory
    if (col + blockCol * BLOCK_SIZE < k && row + blockRow * BLOCK_SIZE < m) {
        Csub[row * k + col] = Cvalue;
    }
}