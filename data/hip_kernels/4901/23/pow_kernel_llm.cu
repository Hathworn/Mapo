#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid
    int stride = gridDim.x * blockDim.x; // Calculate stride
    for (; i < N; i += stride) { // Loop over data with stride
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for float
    }
}