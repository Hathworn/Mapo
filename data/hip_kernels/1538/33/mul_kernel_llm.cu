#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index directly, combining grid and block computation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x; // Calculate total threads
    // Use stride loop to cover entire array if total threads < N
    for (; i < N; i += total_threads) {
        Y[i * INCY] *= X[i * INCX];
    }
}