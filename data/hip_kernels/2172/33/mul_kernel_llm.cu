#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop over elements in strides to improve memory access
    for (int i = idx; i < N; i += stride) {
        Y[i * INCY] *= X[i * INCX];
    }
}