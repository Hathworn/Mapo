#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setDiagonalToZero(float* d_matrix, uint64_t columnsAndRows)
{
    // Calculate the diagonal index directly
    int matrixIndex = (blockDim.x * blockIdx.x + threadIdx.x) * (columnsAndRows + 1);

    // Check for out of bounds before updating
    if (matrixIndex < columnsAndRows * columnsAndRows)
    {
        // Set diagonal element to zero
        d_matrix[matrixIndex] = 0;
    }
}