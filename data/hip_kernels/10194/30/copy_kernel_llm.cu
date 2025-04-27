#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements in stride pattern for better memory access
    for (int index = i; index < N; index += blockDim.x * gridDim.x) {
        Y[index * INCY + OFFY] = X[index * INCX + OFFX];
    }
}