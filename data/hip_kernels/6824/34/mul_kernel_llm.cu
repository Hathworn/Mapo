#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation
    int stride = blockDim.x * gridDim.x; // Calculate stride for increments across threads
    for (; i < N; i += stride) { // Use loop to cover all elements
        Y[i * INCY] *= X[i * INCX];
    }
}