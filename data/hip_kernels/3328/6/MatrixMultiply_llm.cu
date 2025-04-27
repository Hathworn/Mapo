#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMultiply(const float* A_elements, const float* B_elements,  float* C_elements, const int X, const int Y, const int Z)
{
    int baseMatrixRow = blockIdx.y * blockDim.y + threadIdx.y;
    int baseMatrixCol = blockIdx.x * blockDim.x + threadIdx.x;

    __shared__ float As[TILE_SIZE][TILE_SIZE];
    __shared__ float Bs[TILE_SIZE][TILE_SIZE];

    float Cvalue = 0;

    for (int i = 0; i < ((X + TILE_SIZE - 1) / TILE_SIZE); ++i)
    {
        int aRow = baseMatrixRow;
        int aCol = threadIdx.x + i * TILE_SIZE;
        int bRow = threadIdx.y + i * TILE_SIZE;
        int bCol = baseMatrixCol;

        // Load data into shared memory
        if (aRow < Y && aCol < X)
            As[threadIdx.y][threadIdx.x] = A_elements[aRow * X + aCol];
        else
            As[threadIdx.y][threadIdx.x] = 0;

        if (bRow < X && bCol < Z)
            Bs[threadIdx.y][threadIdx.x] = B_elements[bRow * Z + bCol];
        else
            Bs[threadIdx.y][threadIdx.x] = 0;

        __syncthreads();

        // Compute the product using shared memory
        for (int j = 0; j < TILE_SIZE; ++j)
        {
            Cvalue += As[threadIdx.y][j] * Bs[j][threadIdx.x];
        }

        __syncthreads();
    }

    int matrixRow = baseMatrixRow;
    int matrixCol = baseMatrixCol;

    // Save result into global memory
    if (matrixRow < Y && matrixCol < Z)
    {
        C_elements[matrixRow * Z + matrixCol] = Cvalue;
    }
}