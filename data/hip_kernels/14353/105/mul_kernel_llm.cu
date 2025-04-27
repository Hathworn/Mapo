#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the unique thread index within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (i < N) {
        // Perform multiplication
        Y[i * INCY] *= X[i * INCX];
    }
}