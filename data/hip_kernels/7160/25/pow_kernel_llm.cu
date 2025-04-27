#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Use a 1D block and grid infrastructure to simplify index calculation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds before applying operation
    if (idx < N) {
        Y[idx * INCY] = pow(X[idx * INCX], ALPHA);
    }
}