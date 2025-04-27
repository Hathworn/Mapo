#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xnor_gemm(unsigned int* A, unsigned int* B, float* C, int m, int n, int k) {

    // Block row and column
    int blockRow = blockIdx.y;
    int blockCol = blockIdx.x;

    // Thread row and column within Csub
    int row = threadIdx.y;
    int col = threadIdx.x;

    // Each thread block computes one sub-matrix Csub of C
    float* Csub = &C[BLOCK_SIZE * k * blockRow + BLOCK_SIZE * blockCol];

    // Shared memory used to store Asub and Bsub respectively
    __shared__ unsigned int As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ unsigned int Bs[BLOCK_SIZE][BLOCK_SIZE];

    // Each thread computes one element of Csub by accumulating results into Cvalue
    unsigned int Cvalue = 0;

    // Loop over all the sub-matrices of A and B that are required to compute Csub
    for (int i = 0; i < (n / BLOCK_SIZE); ++i) {

        // Get sub-matrix Asub of A
        unsigned int* Asub = &A[BLOCK_SIZE * blockRow * n + BLOCK_SIZE * i];

        // Get sub-matrix Bsub of B
        unsigned int* Bsub = &B[BLOCK_SIZE * k * i + BLOCK_SIZE * blockCol];

        // Load Asub and Bsub from device memory to shared memory
        As[row][col] = Asub[row*n+col];
        Bs[row][col] = Bsub[row*k+col];

        // Synchronize to make sure the sub-matrices are loaded before starting the computation
        __syncthreads();

        // Optimize loop for better performance
        #pragma unroll // Unroll the inner loop for faster execution
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            Cvalue += __popc(As[row][j] ^ Bs[j][col]);
        }

        // Synchronize to ensure completion of computation before loading new sub-matrices
        __syncthreads();
    }

    // Write Csub to device memory
    if (col + blockCol*BLOCK_SIZE < k && row + blockRow*BLOCK_SIZE < m) {
        Csub[row*k+col] = -(2*(float)Cvalue - 32*n);
    }
}