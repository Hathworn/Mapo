#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SquareStep(uint8_t* matrix, unsigned* random, int currentSize, int matrixSize, int maxRowThread, int maxColThread, int randValue)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    // Check bounds to avoid memory access outside the matrix
    if (x < maxRowThread && y < maxColThread)
    {
        int half = currentSize / 2;
        int minRand = -randValue;
        int div = 0;
        int value = 0;

        // Calculate element positions based on x and y and currentSize
        int elemX = x * currentSize * (y % 2 == 0) + y * half * (y % 2 != 0);
        int elemY = (y * half + half) * (y % 2 == 0) + x * currentSize * (y % 2 != 0);

        // Use conditions to avoid divergent branches and to ensure correct index checks
        bool condXMin = elemX > 0;
        value += condXMin ? matrix[(elemX - half) * matrixSize + elemY] : 0;
        div += condXMin;

        bool condXMax = elemX < (matrixSize - 1);
        value += condXMax ? matrix[(elemX + half) * matrixSize + elemY] : 0;
        div += condXMax;

        bool condYMin = elemY > 0;
        value += condYMin ? matrix[elemX * matrixSize + elemY - half] : 0;
        div += condYMin;

        bool condYMax = elemY < (matrixSize - 1);
        value += condYMax ? matrix[elemX * matrixSize + elemY + half] : 0;
        div += condYMax;

        // Update matrix with computed value
        value += (minRand + random[elemX * matrixSize + elemY] % (randValue - minRand));
        matrix[elemX * matrixSize + elemY] = value / div;
    }
}