#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Use stride loop to cover all elements
    int stride = blockDim.x * gridDim.x;
    for (int idx = i; idx < N; idx += stride) {
        Y[OFFY + idx * INCY] += ALPHA * X[OFFX + idx * INCX];
    }
}