#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

#define ar 311
#define ac_br 312
#define bc 115

using namespace std;

__global__ void mat_mul(int *d_A, int *d_B, int *d_C, int rowA, int colA, int rowB, int colB, int rowC, int colC)
{
    // Calculate unique row and column for each thread
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to ensure thread computes valid index
    if(row < rowC && col < colC)
    {
        int sum = 0; // Initialize sum for C[row][col]
        for(int i = 0; i < colA; i++)
        {
            sum += d_A[row * colA + i] * d_B[i * colB + col]; // Accumulate product
        }
        d_C[row * colC + col] = sum; // Store result in C
    }
}