#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixTrans(double * M, double * MT, int rows, int cols)
{
    // Use shared memory to improve memory access efficiency
    __shared__ double tile[32][32 + 1]; // Add padding to avoid bank conflicts

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < rows && col < cols) {
        tile[threadIdx.y][threadIdx.x] = M[col + row * cols];
    }

    __syncthreads();

    // Write transposed output
    row = blockIdx.x * blockDim.x + threadIdx.y; // Transpose block offset
    col = blockIdx.y * blockDim.y + threadIdx.x;

    if (row < cols && col < rows) {
        MT[row + col * cols] = tile[threadIdx.x][threadIdx.y];
    }
}