#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    int gridStride = gridDim.x * blockDim.x; // Calculate grid stride

    // Grid-stride loop for improved utilization
    for (; i < N; i += gridStride) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}