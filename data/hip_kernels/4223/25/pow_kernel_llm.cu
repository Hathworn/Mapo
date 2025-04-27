#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Using a 1D grid and 1D blocks to potentially improve warp execution efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Flatten the condition to improve branch prediction
    if (i < N) {
        Y[i * INCY] = pow(X[i * INCX], ALPHA);
    }
}