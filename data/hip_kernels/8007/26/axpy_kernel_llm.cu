#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int gridStride = gridDim.x * blockDim.x; // Calculate grid stride
    while (i < N) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
        i += gridStride; // Iterate through equally spaced grid indices
    }
}