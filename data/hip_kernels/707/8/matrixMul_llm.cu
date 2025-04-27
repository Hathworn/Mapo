#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(int *A, int *B, int *C, int n)
{
    // Calculate global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    int num = n;
    if (row < num && col < num)
    {
        // Utilize register to accumulate result
        int Cvalue = 0;
        for (int i = 0; i < num; i++)
        {
            // Coalesce memory access for A and B
            Cvalue += A[row * num + i] * B[i * num + col];
        }
        // Directly store result to global memory
        C[row * num + col] = Cvalue;
    }
}