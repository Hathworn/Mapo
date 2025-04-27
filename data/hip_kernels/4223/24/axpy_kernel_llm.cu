#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate thread index using 2D grid and 3D block (more flexibility in block configuration)
    int i = (blockIdx.x * blockDim.x + threadIdx.x) + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Ensure current thread index is within bounds
    if (i < N) {
        // Perform the axpy operation
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}