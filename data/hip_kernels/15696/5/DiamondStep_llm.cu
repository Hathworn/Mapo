#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DiamondStep(uint8_t* matrix, unsigned *random, int currentSize, int matrixSize, int randValue)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int half = currentSize / 2;
    int minRand = -randValue;
    int row = y * currentSize + half;
    int col = x * currentSize + half;

    // Check boundaries to avoid unnecessary computations
    if (row < half || row >= matrixSize - half || col < half || col >= matrixSize - half) return;

    // Cache values for improved memory access
    int topLeft = matrix[(row - half) * matrixSize + (col - half)];
    int topRight = matrix[(row - half) * matrixSize + (col + half)];
    int bottomLeft = matrix[(row + half) * matrixSize + (col - half)];
    int bottomRight = matrix[(row + half) * matrixSize + (col + half)];
    int randomValue = random[row * matrixSize + col] % (randValue - minRand) + minRand;

    // Calculate the value
    int value = (topLeft + topRight + bottomLeft + bottomRight + randomValue) / 4;
    matrix[row * matrixSize + col] = value;
}