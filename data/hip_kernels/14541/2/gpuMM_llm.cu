#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuMM(float* A, float* B, float* C, int N)
{
    // Thread identifiers
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Ensure row and column are within bounds
    if (row < N && col < N) 
    {
        // Compute element C[row, col]
        float sum = 0.f;
        for (int n = 0; n < N; ++n)
        {
            sum += A[row * N + n] * B[n * N + col];
        }
        C[row * N + col] = sum;
    }
}