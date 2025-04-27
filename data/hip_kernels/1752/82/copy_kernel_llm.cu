#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int blockSize = blockDim.x * gridDim.x * gridDim.y; // Calculate entire 1D grid size
    // Loop stride for better utilization
    for(; i < N; i += blockSize)
    {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}