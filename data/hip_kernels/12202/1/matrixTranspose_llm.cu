#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTranspose(unsigned int* A_d, unsigned int *T_d, int rowCount, int colCount) {

    // Use shared memory for tile-based optimization
    __shared__ unsigned int tile[32][32 + 1]; // Avoid bank conflicts

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < rowCount && col < colCount) {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = A_d[row * colCount + col];
    }
    __syncthreads();

    // Transpose block within shared memory
    col = blockIdx.y * blockDim.y + threadIdx.x;
    row = blockIdx.x * blockDim.x + threadIdx.y;

    if (row < colCount && col < rowCount) {
        // Store transposed data from shared memory
        T_d[col * rowCount + row] = tile[threadIdx.x][threadIdx.y];
    }
}