#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads that are in bounds perform the operation
    if (i < N) {
        Y[i * INCY] *= X[i * INCX];
    }
}