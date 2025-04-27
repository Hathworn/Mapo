#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTrans(double *M, double *MT, int rows, int cols)
{
    int row = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global row index
    int col = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global column index

    // Check boundaries to avoid out-of-bounds memory access
    if (row < rows && col < cols) {
        MT[row + col * rows] = M[col + row * cols];  // Perform matrix transposition
    }
}