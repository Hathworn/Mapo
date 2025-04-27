#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Simplified index calculation for 1D grid
    if(i < N) {
        float x_val = X[OFFX + i * INCX];         // Cache accessed X value
        Y[OFFY + i * INCY] += ALPHA * x_val;      // Use cached value for updating Y
    }
}