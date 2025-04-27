#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access pattern and reduce grid strides
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x; // Calculate grid stride
    for (; i < N; i += gridStride) { // Use strided loop for memory coalescing
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}