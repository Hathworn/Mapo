#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *a, float *b, float *c, int m, int n, int k)
{
    // Calculate global row and column indexes
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure row and column are within matrix bounds
    if (row < m && col < k)
    {
        float sum = 0.0f; // Use float for precision
        for (int i = 0; i < n; i++)
        {
            sum += a[row * n + i] * b[i * k + col]; // Perform operation with float
        }
        c[row * k + col] = sum; // Assign computed sum to the result matrix
    }
}