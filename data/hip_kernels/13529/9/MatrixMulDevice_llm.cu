#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for matrix multiplication
__global__ void MatrixMulDevice(float *A, float *B, float *C, int *matrixSize)
{
    int chunk = (*matrixSize) / gridDim.x;
    int i, k;
    int sum = 0;

    // Calculate global row index
    int rowStart = blockIdx.x * chunk;
    int rowEnd = rowStart + chunk;

    // Loop through each row assigned to the block
    for(i = rowStart; i < rowEnd; i++) {
        sum = 0;
        
        // Accumulate dot product for a single row
        for(k = 0; k < *matrixSize; k++) {
            sum += A[i * *matrixSize + k] * B[k * *matrixSize + threadIdx.x];
        }

        // Store the result in C
        C[i * *matrixSize + threadIdx.x] = sum;
    }
}