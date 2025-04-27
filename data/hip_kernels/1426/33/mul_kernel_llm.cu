#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simplicity
    int gridSize = blockDim.x * gridDim.x; // Compute grid stride
    while (i < N) { // Loop over grid to cover all elements
        Y[i * INCY] *= X[i * INCX]; // Perform operation
        i += gridSize; // Move to the next element in the grid
    }
}