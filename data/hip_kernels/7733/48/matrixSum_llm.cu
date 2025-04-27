#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(const double * M1, const double * M2, double * Msum, double alpha, double beta, int rows, int cols)
{
    // Calculate the row and column index using the optimal thread and block configuration
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Proceed with computation only if the thread indices are within matrix bounds
    if (row < rows && col < cols) {
        // Use shared memory (if applicable) for faster data access; in this example, direct computation is used
        Msum[row + col * rows] = alpha * M1[row + col * rows] + beta * M2[row + col * rows];
    }
}