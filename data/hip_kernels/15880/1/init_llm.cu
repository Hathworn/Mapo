#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int order, double * C)
{
    // Calculate global thread ID for 2D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensuring within bounds and initializing C matrix elements
    if (i < order && j < order) {
        C[i * order + j] = 0.0;
    }
}