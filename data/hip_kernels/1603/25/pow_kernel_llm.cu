#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D index calculation
    int stride = blockDim.x * gridDim.x; // Use stride for loop
    for (int i = idx; i < N; i += stride) { // Loop to cover all elements
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single-precision
    }
}