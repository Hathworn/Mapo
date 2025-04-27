#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addMat(float *a, float *b, float *add, int N)
{
    // Calculate the row and column index of the element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the row and column are within the matrix boundaries
    if (row < N && col < N)
    {
        // Compute the index and perform addition
        int idx = row * N + col;
        add[idx] = a[idx] + b[idx];
    }
}