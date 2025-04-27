```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTrans(double * M, double * MT, int rows, int cols)
{
    // Use shared memory for faster access
    __shared__ double tile[32][32+1]; // Avoid bank conflicts with padding

    int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < cols && yIndex < rows) {
        int index_in = yIndex * cols + xIndex;
        tile[threadIdx.y][threadIdx.x] = M[index_in];
    }

    __syncthreads(); // Synchronize threads within block

    xIndex = blockIdx.y * blockDim.y + threadIdx.x; // Transpose block offset
    yIndex = blockIdx.x * blockDim.x + threadIdx.y;

    if (xIndex < rows && yIndex < cols) {
        int index_out = yIndex * rows + xIndex;
        MT[index_out] = tile[threadIdx.x][threadIdx.y];
    }
}