#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTrans(double *M, double *MT, int rows, int cols)
{
    // Use shared memory for coalesced accesses and to minimize global memory transactions
    __shared__ double tile[32][32 + 1]; // +1 to avoid bank conflicts

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < rows && col < cols) {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = M[col + row * cols];
    }
    __syncthreads(); // Ensure all data is loaded before writing transposed

    row = blockIdx.y * blockDim.y + threadIdx.x;
    col = blockIdx.x * blockDim.x + threadIdx.y;

    if (row < cols && col < rows) {
        // Write data from shared memory to transposed matrix
        MT[col + row * rows] = tile[threadIdx.x][threadIdx.y];
    }
}