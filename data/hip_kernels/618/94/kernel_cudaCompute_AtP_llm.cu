#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for computing AtP
__global__ void kernel_cudaCompute_AtP(double *d_A, double *d_P, double *d_AtP, int rows, int columns)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use if condition to avoid out-of-bound memory access
    if (ind < rows * columns) 
    {
        // Pre-compute indices to reduce repetitive calculations
        int column = ind / rows; 
        int row = ind % rows;

        // Perform computation using pre-computed indices
        d_AtP[row + column * rows] = d_A[column + row * columns] * d_P[column];
    }
}