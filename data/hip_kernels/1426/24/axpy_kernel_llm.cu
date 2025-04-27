#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation
    if (i < N) {
        // Perform axpy operation if within bounds
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}