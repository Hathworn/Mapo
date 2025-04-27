#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTrans(double* __restrict__ M, double* __restrict__ MT, int rows, int cols)
{
    // Use shared memory for better data locality
    __shared__ double tile[32][32 + 1];  // Padding added to avoid bank conflicts

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads within bounds before loading data into shared memory
    if (row < rows && col < cols) {
        tile[threadIdx.y][threadIdx.x] = M[col + row * cols];
    }
    __syncthreads();

    // Transpose using shared memory
    row = blockIdx.y * blockDim.y + threadIdx.x;
    col = blockIdx.x * blockDim.x + threadIdx.y;

    // Ensure threads are within bounds before writing data back to global memory
    if (row < cols && col < rows) {
        MT[row + col * cols] = tile[threadIdx.x][threadIdx.y];
    }
}