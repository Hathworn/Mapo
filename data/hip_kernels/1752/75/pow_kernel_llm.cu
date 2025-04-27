#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop
    for(; i < N; i += stride) { // Use grid-stride loop for better occupancy
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single-precision floating-point
    }
}