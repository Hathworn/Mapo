#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = gridDim.x * blockDim.x; // Stride for grid-stride loop

    for (int i = idx; i < N; i += stride) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single precision
    }
}