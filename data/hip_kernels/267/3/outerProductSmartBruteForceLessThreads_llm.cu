#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void outerProductSmartBruteForceLessThreads(float* resultMatrix, float* vec, uint64_t vectorLength)
{
    int col = (blockIdx.x * blockDim.x) + threadIdx.x; // Column index
    int row = (blockIdx.y * blockDim.y) + threadIdx.y; // Row index

    // Check bounds
    if (row >= vectorLength || col >= vectorLength)
        return;

    // Optimize thread usage by computing only upper triangular matrix (row <= col)
    if (row > col) {
        int temp = row;
        row = col;
        col = temp;
    }

    int index = (row * vectorLength + col) - (row * (row + 1)) / 2;

    resultMatrix[index] = vec[row] * vec[col];
}