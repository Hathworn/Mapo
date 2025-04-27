#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minus_one(float *matrix, unsigned int *indices, unsigned int row, unsigned int col) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < row) {
        // Load index and col once to reduce redundant calculations
        unsigned int colIndex = indices[index];
        unsigned int matrixIndex = index * col + colIndex;
        // Use atomic operation for better performance if parallel writes may happen
        atomicExch(&matrix[matrixIndex], matrix[matrixIndex] - 1.0f);
    }
}