#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply2(float* A, float* C, int size) 
{
    // Initialize sum to zero
    float sum = 0;
    // Compute column and row indices for the current thread
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    int Row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within matrix bounds
    if (Col < size && Row < size) {
        // Unroll loop for better efficiency (assuming size is a multiple of 4)
        #pragma unroll
        for (int k = 0; k < size; k++)
            sum += A[k * size + Row] * A[k * size + Col];
        
        // Write the computed sum to the output matrix
        C[Row * size + Col] = sum;
    }
}