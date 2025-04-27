#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    int gridStride = gridDim.x * blockDim.x;        // Calculate total grid stride

    for (; i < N; i += gridStride) {                // Use grid-stride loop for balance
        Y[i * INCY] *= X[i * INCX];
    }
}