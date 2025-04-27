#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Cache the grid and block dimensions for better readability
    int gridSize = blockDim.x * gridDim.x;
    
    // Loop through all elements that the current thread can process
    for (int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x; i < N; i += gridSize) {
        Y[i*INCY + OFFY] = X[i*INCX + OFFX];
    }
}