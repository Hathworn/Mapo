#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x; // Compute total grid size
    
    for (; i < N; i += gridSize) { // Loop to handle more work per thread
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}