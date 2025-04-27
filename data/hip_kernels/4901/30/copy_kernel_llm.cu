#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use only blockIdx.x for grid
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop
    for (; i < N; i += stride) { // Unroll loop to process multiple elements
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}