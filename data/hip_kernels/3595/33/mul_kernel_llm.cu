#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Compute global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int size = gridDim.x * blockDim.x;

    // Loop over elements with stride equal to total number of threads
    for (; i < N; i += size) {
        Y[i * INCY] *= X[i * INCX];
    }
}