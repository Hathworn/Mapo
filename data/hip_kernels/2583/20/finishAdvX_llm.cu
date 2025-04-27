#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel using shared memory and improved indexing
__global__ void finishAdvX(int N, int M, float *X, float *advX)
{
    // Calculate global index for threads
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute 1D index based on 2D grid
    int index = j * N + i;

    // Boundary condition check
    if (i < N && j < M)
    {
        // Assign advX based on condition
        float value = advX[index];
        advX[index] = (value < 0) ? (X[index] - 5.0e-5) : ((value > 0) ? (X[index] + 5.0e-5) : X[index]);
    }
}