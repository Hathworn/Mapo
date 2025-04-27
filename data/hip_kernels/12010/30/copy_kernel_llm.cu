#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x;           // Calculate stride for grid stride loop
    for (; i < N; i += stride) {                   // Use grid stride looping for better parallelism
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];   // Copy elements from X to Y
    }
}