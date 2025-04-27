#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simplicity
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    while (i < N) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX]; // Perform computation
        i += stride; // Move to next data chunk
    }
}