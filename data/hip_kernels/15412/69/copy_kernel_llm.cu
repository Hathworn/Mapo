#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride to handle larger arrays and improve parallelism
    while (i < N) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
        i += blockDim.x * gridDim.x; // Move index by grid-stride for next iteration
    }
}