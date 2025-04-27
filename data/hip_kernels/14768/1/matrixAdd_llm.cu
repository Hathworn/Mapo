#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixAdd(int *a, int *b, int *c, int N)
{
    // Calculate global thread ID
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within matrix bounds
    if (col < N && row < N)
    {
        int index = col + row * N; // Compute linear index for 2D grid
        c[index] = a[index] + b[index]; // Perform addition
    }
}