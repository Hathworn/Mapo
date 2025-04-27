#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd(float *A, float *B, float *C, int n)
{
    // Calculate the row and column index for the element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and perform addition
    if (row < n && col < n)
    {
        int i = row * n + col;
        C[i] = A[i] + B[i];
    }
}