#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = gridDim.x * blockDim.x; // Calculate grid stride

    for (int i = idx; i < N; i += stride) { // Loop with stride to cover all elements
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for improved performance with float
    }
}