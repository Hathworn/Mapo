#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_global(int *A, int *B, int *result, int n)
{
    // Cache thread and block indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if current thread is within matrix bounds
    if (col < n && row < n)
    {
        int sum = 0;
        // Use a single loop to accumulate the result
        for (int k = 0; k < n; ++k)
        {
            sum += A[row * n + k] * B[k * n + col];
        }
        result[row * n + col] = sum; // Write the computed result outside the loop
    }
}