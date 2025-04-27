#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nmfcpy(double *mat, double *matcp, int m, int n) 
{
    // Calculate the global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single check to reduce branching
    int index = row * n + col;
    if (row < m && col < n) 
    {
        // Direct indexing to optimize memory access
        mat[index] = matcp[index];
    }
}