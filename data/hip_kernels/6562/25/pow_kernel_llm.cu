#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Utilizing grid-stride loop to handle more elements, improve memory access, and allow more flexibility on thread and block configuration
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) 
    {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single precision
    }
}