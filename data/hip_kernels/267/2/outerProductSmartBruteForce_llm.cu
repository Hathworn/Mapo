#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void outerProductSmartBruteForce(float* resultMatrix, float* vec, int vectorLength)
{
    // Compute global row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds and symmetry check
    if (row < vectorLength && col < vectorLength && row <= col) {
        int index = row * vectorLength + col - (row * (row + 1)) / 2;
        resultMatrix[index] = vec[row] * vec[col]; // Use assignment instead of addition
    }
}