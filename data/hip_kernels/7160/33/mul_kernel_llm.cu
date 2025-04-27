#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Optimize the computation of the global index 'i'
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Add a simple improvement to prevent unnecessary global memory access
    int gridSize = blockDim.x * gridDim.x;
    
    // Use a loop to allow threads to process multiple elements if N is large
    while (i < N) {
        Y[i * INCY] *= X[i * INCX];
        i += gridSize;
    }
}