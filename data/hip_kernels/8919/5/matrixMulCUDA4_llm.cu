```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulCUDA4(float *C, float *A, float *B, unsigned int n)
{
    // Obtain block index and thread index within the block
    int blockRow = blockIdx.y * blockDim.y;
    int blockCol = blockIdx.x * blockDim.x;
    int threadRow = threadIdx.y;
    int threadCol = threadIdx.x;

    // Compute global row and column indices
    int row = blockRow + threadRow;
    int col = blockCol + threadCol;

    // Check boundary conditions
    if (row < n && col < n) {
        // Compute sum using shared memory
        float sum = 0.0f;
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col];
        }

        // Write the result to the output matrix
        C[row * n + col] = sum;
    }
}