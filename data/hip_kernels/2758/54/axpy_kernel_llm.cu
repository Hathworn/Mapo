#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Use grid-stride loop to improve efficiency for large N
    for (int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x * gridDim.y) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}