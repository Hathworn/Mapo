#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_matrices(float *ad, float *bd, float *cd, int N)
{
    // Calculate row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that the indices are within bounds
    if (row < N && col < N)
    {
        // Perform element-wise addition
        cd[row * N + col] = ad[row * N + col] + bd[row * N + col];
    }
}