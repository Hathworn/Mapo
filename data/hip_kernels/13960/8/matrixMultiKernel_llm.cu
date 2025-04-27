#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiKernel(double *C, double *A, double *B, int Width){
    const int BLOCK_SIZE = 16; // NOTE: This must be similar to line 338
    
    // Calculate global row and column of the matrix
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    double temp_c = 0.0;

    // Loop over the submatrices of A and B required to calculate C(row, col)
    for (int m = 0; m < Width / BLOCK_SIZE; ++m) {
        // Declaring shared memory for submatrices
        __shared__ double sub_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ double sub_b[BLOCK_SIZE][BLOCK_SIZE];

        // Load elements into shared memory
        sub_a[threadIdx.y][threadIdx.x] = A[row * Width + m * BLOCK_SIZE + threadIdx.x];
        sub_b[threadIdx.y][threadIdx.x] = B[(m * BLOCK_SIZE + threadIdx.y) * Width + col];

        __syncthreads();

        // Perform multiplication on the submatrices
        #pragma unroll
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            temp_c += sub_a[threadIdx.y][k] * sub_b[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Write the result to global memory
    C[row * Width + col] = temp_c;
}