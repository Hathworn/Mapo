#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd(float *A, float *B, float *C, int n)
{
    // Compute global row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < n && col < n)
    {
        // Flatten row and column into a single index
        int i = row * n + col;
        // Perform addition
        C[i] = A[i] + B[i];
    }
}