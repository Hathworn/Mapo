#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate linear index
    int stride = blockDim.x * gridDim.x; // Determine grid stride
    for (; i < N; i += stride) { // Use grid-stride loop
        Y[i * INCY] *= X[i * INCX]; // Perform multiplication
    }
}