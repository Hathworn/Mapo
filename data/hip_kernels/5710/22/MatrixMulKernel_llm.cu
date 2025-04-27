#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel (float* Md, float* Nd, float* Pd, int ncols) {
    // Shared memory for Md and Nd sub-matrices
    __shared__ float Ms[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Ns[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float Pvalue = 0;

    // Loop over sub-matrices for tiled multiplication
    for (int m = 0; m < (ncols / BLOCK_SIZE); ++m) {
        // Load Md and Nd sub-matrices into shared memory
        Ms[threadIdx.y][threadIdx.x] = Md[row * ncols + (m * BLOCK_SIZE + threadIdx.x)];
        Ns[threadIdx.y][threadIdx.x] = Nd[(m * BLOCK_SIZE + threadIdx.y) * ncols + col];
        __syncthreads();

        // Multiply Md and Nd sub-matrices
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            Pvalue += Ms[threadIdx.y][k] * Ns[k][threadIdx.x];
        }
        __syncthreads();
    }

    // Write back the result
    Pd[row * ncols + col] = Pvalue;
}