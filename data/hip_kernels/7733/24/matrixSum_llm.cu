#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(const double * M1, const double * M2, double * Msum, double alpha, double beta, int rows, int cols)
{
    // Calculate flattened thread ID for faster memory access
    int index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * rows;
    
    // Check if index is within bounds
    if (index < rows * cols) {
        // Perform computation
        Msum[index] = alpha * M1[index] + beta * M2[index];
    }
}