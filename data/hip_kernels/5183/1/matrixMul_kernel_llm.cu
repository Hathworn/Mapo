```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMul_kernel(float * A, float * B, float * C, int N)
{
    // Calculate row and column index for each thread
    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize local sum accumulation
    float tmpSum = 0;

    // Check bounds to ensure we are within matrix dimensions
    if (ROW < N && COL < N)
    {
        // Unroll the loop where possible to improve performance
        for (int i = 0; i < N; i += 4)
        {
            // Perform operation in chunks to utilize instruction level parallelism
            tmpSum += A[ROW * N + i] * B[i * N + COL];
            if (i + 1 < N) tmpSum += A[ROW * N + i + 1] * B[(i + 1) * N + COL];
            if (i + 2 < N) tmpSum += A[ROW * N + i + 2] * B[(i + 2) * N + COL];
            if (i + 3 < N) tmpSum += A[ROW * N + i + 3] * B[(i + 3) * N + COL];
        }
    }
    // Store the computed value in the result matrix
    if (ROW < N && COL < N)
        C[ROW * N + COL] = tmpSum;
}