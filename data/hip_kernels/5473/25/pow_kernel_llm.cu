#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use effective tensor core access pattern if possible
    for (; i < N; i += blockDim.x * gridDim.x) {
        // Perform the operation
        Y[i * INCY] = powf(X[i * INCX], ALPHA);
    }
}