#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Flatten block and thread indices

    // Use strided access to improve memory access pattern
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}