#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuMM(double *A, double *B, double *C, int N)
{
    // Matrix multiplication for NxN matrices C=A*B
    // Each thread computes a single element of C
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < N && col < N) // Check to ensure row and col are within bounds
    {
        double sum = 0.0; // Use double to match input data type
        for (int n = 0; n < N; ++n)
        {
            sum += A[row * N + n] * B[n * N + col];
        }
        C[row * N + col] = sum;
    }
}