#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simplicity
    int gridSize = gridDim.x * blockDim.x; // Calculate total grid size

    for (; i < N; i += gridSize) { // Loop over elements in increments of gridSize
        Y[i * INCY + OFFY] = X[i * INCX + OFFX]; // Efficient memory access
    }
}