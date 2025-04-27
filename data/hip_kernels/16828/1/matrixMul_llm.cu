#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(int *a, int *b, int *c, int ROW, int COLUMNS, int temp)
{
    // Calculate row and column index of the matrix element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if(row < ROW && col < COLUMNS) 
    {
        int sum = 0;
        // Accumulate the sum for dot product
        for(int i = 0; i < temp; i++)
        {
            sum += a[row * temp + i] * b[i * COLUMNS + col];
        }
        // Store the result in matrix c
        c[row * COLUMNS + col] = sum;
    }
}