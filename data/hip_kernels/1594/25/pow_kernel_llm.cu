#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single loop for better efficiency
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[idx * INCY] = pow(X[idx * INCX], ALPHA);
    }
}