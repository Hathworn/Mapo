#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation for 1D grid
    int gridSize = blockDim.x * gridDim.x; // Calculate grid size
    while (i < N) {
        Y[i * INCY] *= X[i * INCX];
        i += gridSize; // Stride through the array
    }
}