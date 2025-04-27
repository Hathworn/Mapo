#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute unique thread index.
    int stride = gridDim.x * blockDim.x;           // Calculate stride for grid-stride loop.
    for (; i < N; i += stride) {                    // Use grid-stride loop for better utilization.
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}