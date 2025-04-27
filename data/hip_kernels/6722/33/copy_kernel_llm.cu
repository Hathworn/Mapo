#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x * blockDim.x);

    // Ensure the thread index is within bounds
    if(i < N) {
        // Perform the copy operation
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}