#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy2D(float scalar, float * x, float * y, int NX, int NY)
{
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Use a single index calculation for performance
    int index = row * NY + col;

    // Ensure computation is within bounds
    if (row < NX && col < NY) {
        y[index] = scalar * x[index] + y[index];
    }
}