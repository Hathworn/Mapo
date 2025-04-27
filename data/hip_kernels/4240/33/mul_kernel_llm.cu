#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize: Remove blockIdx.y, as it is not needed for 1D grid
    int gridSize = blockDim.x * gridDim.x; // Calculate grid stride for loop to handle larger arrays

    // Use grid-stride loop to allow handling of N elements with fewer threads
    for (; i < N; i += gridSize) 
    {
        Y[i * INCY] *= X[i * INCX];
    }
}