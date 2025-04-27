#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult2Matrix(float *M, float *N, float *P) {
    // Shared memory for tiles of matrices M and N
    __shared__ float tileM[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float tileN[BLOCK_SIZE][BLOCK_SIZE];

    // Calculate the row and column indices of P
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    
    float Pvalue = 0;

    // Loop over the tiles of the input matrices
    for (int t = 0; t < (WIDTH + BLOCK_SIZE - 1) / BLOCK_SIZE; ++t) {
        // Collaborative loading of tiles into shared memory
        if (Row < WIDTH && t * BLOCK_SIZE + threadIdx.x < WIDTH)
            tileM[threadIdx.y][threadIdx.x] = M[Row * WIDTH + t * BLOCK_SIZE + threadIdx.x];
        else
            tileM[threadIdx.y][threadIdx.x] = 0.0;

        if (Col < WIDTH && t * BLOCK_SIZE + threadIdx.y < WIDTH)
            tileN[threadIdx.y][threadIdx.x] = N[(t * BLOCK_SIZE + threadIdx.y) * WIDTH + Col];
        else
            tileN[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Multiply the tiles together
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            Pvalue += tileM[threadIdx.y][k] * tileN[k][threadIdx.x];
        }
        __syncthreads();
    }

    // Write result to matrix P
    if (Row < WIDTH && Col < WIDTH) {
        P[Row * WIDTH + Col] = Pvalue;
    }
}