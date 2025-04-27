#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(const double *M1, const double *M2, double *Msum, double alpha, double beta, int rows, int cols)
{
    // Use 1D grid and thread index for better memory coalescing
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate total elements in the matrix
    int totalElements = rows * cols;

    // Ensure the thread index is within bounds
    if (tid < totalElements) {
        Msum[tid] = alpha * M1[tid] + beta * M2[tid];
    }
}