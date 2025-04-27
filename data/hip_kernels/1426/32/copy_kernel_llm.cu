#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate unique thread index across grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;
    
    // Loop over elements in increments of grid size; leverage global memory coalescing
    for (; i < N; i += gridSize) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}